Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OitR4-0006m8-7x
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 20:20:27 +0200
Received: by eyf5 with SMTP id 5so4067863eyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 11:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=RZ+mMIQQvim551l8hug4GSL2gZYTl4zNCZPa4K6ot7Q=;
	b=asO2JErHxPv04SfWsdFjsmO8zZL/jOzJWEcwSsLGRqgwjDMPjkT8xEkrbMGEKRLaRH
	ZoZ6/P2ATySNiqdfn8PCcKwPttizY+/E1D5R9f6ZoYD4JOnQmj8ephzaMo4mSIShpvyV
	XbLw2NFHsEale5ztl/xc2wzhjXdTMwBbZ8Q3o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=xzjC9PGy2S5nfmdB5p3NYg+UYNPBKEWZCZkO15RhKgQQoqxWsPd00tdD3SuaPrqhN5
	hR0s+LltQFlYZNNuVxFMXzvTQxT0BNDm04HHefwkC1B5uOECm6hf7IWXycfCyj+4Uq26
	S/GO44q8alTMfuE5jtc84FTP662UYQNmIQxeU=
Received: by 10.213.48.131 with SMTP id r3mr13872454ebf.69.1281464415322; Tue, 
	10 Aug 2010 11:20:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.213.35.135 with HTTP; Tue, 10 Aug 2010 11:19:55 -0700 (PDT)
In-Reply-To: <1281451998.16235.890.camel@rex>
References: <1281336254-11566-1-git-send-email-raj.khem@gmail.com> 
	<1281352360.16235.525.camel@rex>
	<AANLkTin_LwLx3V2C3tYPA03cxrAvu6w+h3VHZDSY0k7F@mail.gmail.com> 
	<1281451998.16235.890.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Aug 2010 11:19:55 -0700
Message-ID: <AANLkTimfVhPPkCFf3s9P9SDZsKCU2q=s+xO1mxwnD+mH@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cross.bbclass: Override STAGING_* paths to match cross installation
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
X-List-Received-Date: Tue, 10 Aug 2010 18:20:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2010 at 7:53 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Mon, 2010-08-09 at 08:48 -0700, Khem Raj wrote:
>> On Mon, Aug 9, 2010 at 4:12 AM, Richard Purdie <rpurdie@rpsys.net> wrote=
:
>> > Hi Khem,
>> >
>> > On Sun, 2010-08-08 at 23:44 -0700, Khem Raj wrote:
>> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> ---
>> >> =A0classes/cross.bbclass | =A0 =A08 ++++++++
>> >> =A01 files changed, 8 insertions(+), 0 deletions(-)
>> >>
>> >> diff --git a/classes/cross.bbclass b/classes/cross.bbclass
>> >> index cf14db1..64f7902 100644
>> >> --- a/classes/cross.bbclass
>> >> +++ b/classes/cross.bbclass
>> >> @@ -50,6 +50,14 @@ exec_prefix =3D "${prefix}"
>> >> =A0base_sbindir =3D "${base_prefix}/bin"
>> >> =A0sbindir =3D "${exec_prefix}/bin"
>> >>
>> >> +# staging should be special for cross
>> >> +STAGING_BINDIR =3D "${bindir}"
>> >> +STAGING_LIBDIR =3D "${libdir}"
>> >> +STAGING_INCDIR =3D "${includedir}"
>> >> +STAGING_ETCDIR =3D "${sysconfdir}"
>> >> +STAGING_DATADIR =3D "${datadir}"
>> >> +STAGING_SBINDIR =3D "${sbindir}"
>> >> +
>> >> =A0do_install () {
>> >> =A0 =A0 =A0 oe_runmake 'DESTDIR=3D${D}' install
>> >> =A0}
>> >
>> > Can you explain a bit more about why is this needed?
>>
>> yes. for cross packages prefix is set in cross.bbclass to be
>> ${base_prefix}${prefix_native}/${BASE_PACKAGE_ARCH}
>> which already points into native sysroot and bindir, datadir etc are
>> defined based on prefix in bitbake.conf so
>> for cross packages datadir already points to where it is in the final
>> install location of the cross packages.
>>
>> but STAGING_* dirs are then defined like below
>>
>> STAGING_DIR_HOST =3D "${STAGING_DIR}/${BASEPKG_HOST_SYS}"
>> STAGING_BINDIR =3D "${STAGING_DIR_HOST}${bindir}"
>>
>> where
>> STAGING_DIR_HOST expands to <native sysroot> in the case of cross
>> packages because for them BASEPKG_HOST_SYS
>> is the build system itself. I think this is a the reason why we have
>> NATIVE_STAGING_* vars defined separately.
>> probably we should have the same set defined for cross too may be
>> something like CROSS_STAGING_* is one solution.
>>
>> and now all these STAGING_* defines create another native sysroot
>> directory insise the existing one.
>> so I get /scratch/oe/sysroot/x86_64-linux/scrarch/oe/sysroot/x86_64-linu=
x/usr/armv5te/shared/
>> etc. paths while
>> building binutils-cross
>>
>> because STAGING_* variables are used in autotools.bbclass
>>
>> Thats why this patch
>
> So the problem is empty directory creation?

yes.

>
> I'm tempted to suggest a more radical approach of not having all these
> directories created by autotools.bbclass...

thats a good idea I can look into it.

yeah this patch actually will need another patch in crosssdk.bbclass.
Actually STAGING_DIR is a bit confusing when it comes to cross and sdk
packages.

May be we should have STAGING_DIR_{CROSS|NATIVE|SDK|NATIVESDK|TARGET}
all defined and used appropriately. right now the STAGING_DIR_HOST and
these various STAGING_DIR_* defines get it very confusing.

>
> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


