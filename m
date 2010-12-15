Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PSuIC-0001ha-Tz
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 17:33:29 +0100
Received: by wyb40 with SMTP id 40so1691004wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 08:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=ts2QzFimY1BON+bfDWYCROrrTl8XBn6ZYxLSZQLmR+c=;
	b=Whw/7deKZEPFlXpz4nK1pv7Qvvt4/3tb7D6P14XO65puCxlBFpwEE3JvpgNiNxXdaU
	wreGOxl5gOP1j1Fqdk0SBygQ3l0kGnPl+fXaHgrecAd7+5Flf6HlgJdL4zYyDuDxrGiK
	dNfklnnivTTlM5Ij72+a8/z2AEy4pJulQ72q0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	b=TAii69XrwrprKFFWlSkamzf8dAClo+svG8xien3R9rIvZP2lboY/ZLnJ8WKxgL5gyd
	P1fdSlS8r0Yl9QWUSOEn2AbmYEmFrhD/y7artunCmJPqquEG3Ojwo9RiN1S8q5nfv9qF
	NJ9Wu/u8PkMVPNCpCJ9ov+Oxk6V1t+NMgnVtA=
Received: by 10.216.165.85 with SMTP id d63mr453613wel.12.1292430710983; Wed,
	15 Dec 2010 08:31:50 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Wed, 15 Dec 2010 08:31:30 -0800 (PST)
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 15 Dec 2010 09:31:30 -0700
X-Google-Sender-Auth: xDjfEmG9QI9G-3kLuMAz1sxbSTQ
Message-ID: <AANLkTik+TNUXiWsBu5nY1wN3yR-qK4qAeSe3REbmysrD@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] Variable typing support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Dec 2010 16:33:29 -0000
Content-Type: text/plain; charset=UTF-8

Greetings,

I'd like to propose inclusion of some work I've done on a branch to implement
variable typing.  This implementation consists of three components:

- oe.types python module, whose job it is to construct objects of the defined
  type for a given variable in the metadata
- typecheck.bbclass, which iterates over all configuration variables with a
  type defined and uses oe.types to check the validity of the values
- flags to mark up the variables with the appropriate types

This gives us a few benefits:

- Automatic sanity checking of all configuration variables with a defined type
- Avoid duplicating the "how do I make use of the value of this variable"
  logic between its users.  For variables like PATH, this is simply a split(),
  for boolean variables, the duplication can result in confusing, or even
  mismatched semantics (is this 0/1, empty/nonempty, what?)
- Make it easier to create a configuration UI, as the type information could
  be used to provide a better interface than a text edit box (e.g checkbox for
  'boolean', dropdown for 'choice')

This functionality is entirely opt-in right now.  To enable the configuration
variable type checking, simply INHERIT += "typecheck".  Example of a failing
type check:

BAZ = "foo"
BAZ[type] = "boolean"

$ bitbake -p
FATAL: BAZ: Invalid boolean value 'foo'
$

Examples of leveraging oe.types in a python snippet:

PACKAGES[type] = "list"

python () {
    import oe.types
    for pkg in oe.types.value("PACKAGES", d):
        bb.note("package: %s" % pkg)
}

LIBTOOL_HAS_SYSROOT = "yes"
LIBTOOL_HAS_SYSROOT[type] = "boolean"

python () {
    import oe.types
    assert(oe.types.value("LIBTOOL_HAS_SYSROOT", d) == True)
}

https://github.com/kergoth/openembedded/commit/c278cd7 shows the core
implementation, along with the description, which is shown above.
https://github.com/kergoth/openembedded/compare/master...typing shows
the changes I've done for it so far, including the python module,
variable type checking class, and examples of usage in both
bitbake.conf and classes.

Comments?  I'd love to hear what people think of this.  Note that the
main purpose of the type *checking* is to catch issues with user
configuration variables, as opposed to variables set by recipes or
classes, but of course the markup for the others is useful if one
wants to utilize oe.types in python code.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


