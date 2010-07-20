Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1ObEBd-0000Y4-Dm
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 16:53:52 +0200
Received: by bwz10 with SMTP id 10so3214644bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 07:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=nFavCBuS1G9yWfqIEXlG6IDB3NOqY3RFb5c7MlaKLXk=;
	b=w47jZOwSiYoRBB21L7ymOiG190hfrMNboq1GPEetrmnPiJCgHUVy5HdOuf6GNKH/5C
	Y0iiRqzi2lW4XabuyyMU62Y6hhKRKhZ6wx+dVrUAsnGrg86Wb9rzabi/sY0wO9zawJKx
	wKkwnIYV3/iJn+GZVJS9Oz2Tr+wJj/7/oda3I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=amzUbSsEO9VsqSuNubMzzw8uV/zhMw4EgIvo8auDXcIJq1e4jVKjh0WyfVE5/+u4Ss
	rXooNxCKxXnOMpvf9zobAV2a3tUYVLjXNCvP9uSBxhlp4Qi1Mu+p9lmFz0KQRwGrokcb
	mX+iK8X7+dZ5tBKtfLAwQ7kihd5vzuRnfYaLY=
MIME-Version: 1.0
Received: by 10.204.119.134 with SMTP id z6mr720812bkq.193.1279637560728; Tue, 
	20 Jul 2010 07:52:40 -0700 (PDT)
Received: by 10.204.32.65 with HTTP; Tue, 20 Jul 2010 07:52:40 -0700 (PDT)
In-Reply-To: <AANLkTilB16RBCmlt-mnOLlk2A5no0jrmm_LWlaywDW-X@mail.gmail.com>
References: <AANLkTil7o0fTTOKgeENfJ54exQUXvpnDzIicIWfbDG2-@mail.gmail.com>
	<AANLkTilB16RBCmlt-mnOLlk2A5no0jrmm_LWlaywDW-X@mail.gmail.com>
Date: Tue, 20 Jul 2010 18:52:40 +0400
Message-ID: <AANLkTimYkJaa2nCj_1LiDYwBtuONKIivzD5M_OYXnDF2@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: slapinid@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: Strangeness with mkdosfs on OMAP3 board
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
X-List-Received-Date: Tue, 20 Jul 2010 14:54:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 9, 2010 at 1:45 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Jul 8, 2010 at 6:54 AM, Sergey Lapin <slapinid@gmail.com> wrote:
>> -D_FILE_OFFSET_BITS=64, where it has gone?
>
> CFLAGS are overwritten, and the makefile is a bit non cross compilation friendly
> you can add this
>
> CFLAGS += "-D_FILE_OFFSET_BITS=64
>
> to dosfstools_2.11.bb and then rebuild just this recipe.
>
> Does that help ?
Yeah, this helps. Actually. the fast-baked patch I use locally:
diff --git a/recipes/dosfstools/dosfstools_2.11.bb
b/recipes/dosfstools/dosfstools_2.11.bb
index 211912a..89522f5 100644
--- a/recipes/dosfstools/dosfstools_2.11.bb
+++ b/recipes/dosfstools/dosfstools_2.11.bb
@@ -8,15 +8,22 @@ SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "GPLv2"

-PR = "r0"
+PR = "r1"

 SRC_URI = "ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-${PV}.src.tar.gz
\
           file://alignment_hack.patch \
            file://msdos_fat12_undefined.patch \
           file://include-linux-types.patch"

+do_compile () {
+       oe_runmake "PREFIX=${D}" "SBINDIR=${D}${sbindir}" \
+                  CFLAGS="${CFLAGS} -D_FILE_OFFSET_BITS=64" \
+                  "MANDIR=${D}${mandir}/man8"
+}
+
 do_install () {
        oe_runmake "PREFIX=${D}" "SBINDIR=${D}${sbindir}" \
+                  CFLAGS="${CFLAGS} -D_FILE_OFFSET_BITS=64" \
                   "MANDIR=${D}${mandir}/man8" install
 }

But, probably, it is too many lines and I had no time to make proper
one and commit :(


