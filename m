Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radoslav@kolev.info>) id 1Q3XOC-0004Ne-PC
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Mar 2011 18:35:04 +0100
Received: by qyk27 with SMTP id 27so1564781qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2011 10:33:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.69.145 with SMTP id z17mr1839750qai.151.1301160788625;
	Sat, 26 Mar 2011 10:33:08 -0700 (PDT)
Received: by 10.229.189.130 with HTTP; Sat, 26 Mar 2011 10:33:08 -0700 (PDT)
In-Reply-To: <iml6ie$bb4$1@dough.gmane.org>
References: <1301158234-13658-1-git-send-email-radoslav@kolev.info>
	<iml6ie$bb4$1@dough.gmane.org>
Date: Sat, 26 Mar 2011 19:33:08 +0200
Message-ID: <AANLkTinYwCR3vQq+HskwJonw0YKd8+8fGQRKhqwpWhqh@mail.gmail.com>
From: Radoslav Kolev <radoslav@kolev.info>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Added a recipe for libmodbus
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
X-List-Received-Date: Sat, 26 Mar 2011 17:35:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Mar 26, 2011 at 7:08 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 26-03-11 17:50, Radoslav Kolev wrote:
>
>> +++ b/recipes/libmodbus/libmodbus_git.bb
>> @@ -0,0 +1,11 @@
>> +require libmodbus.inc
>> +
>> +SRCREV = "6254ede9156095ee0300"
>> +
>> +PR = "${INC_PR}.1"
>
> That's missing a PV = 1.2 or similar

Ah, OK. Just I'm not sure what that value should be.

So, the libmodbus project releases two tarballs - stable and
development. Now stable is at 2.0.3, and I made a separate recipe for
it.

I didn't make a recipe for the current development tarball (now at
2.9.3), but instead added this _git recipe for which the SRCREV points
to the top of the master branch as of today. It is not tagged with any
numeric release version. My intention being to be used by people who
want to test the bleeding edge, and for this reason added the
DEFAULT_PREFERENCE = "-1" to it, so it has to be explicitly selected.

This is the first recipe I submit, so I don't know exactly what is the
official policy for beta/trunk versions of software.

In this case when we have two releases - stable and dev tarballs and a
git repository what would you advise to do?

Best regads,
Radoslav Kolev


