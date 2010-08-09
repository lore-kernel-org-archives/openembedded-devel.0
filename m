Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OiUaX-0008R4-ST
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 17:48:47 +0200
Received: by bwz8 with SMTP id 8so1359050bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 08:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=YfT1OvQM+ohJlVR2Yp9ViLof2v/+eb+D2pleBTjc3j4=;
	b=WHeHcpQuYfvE4YTGFlOty30Q8Bx4QoEZiYoAoT15FxWkzTfqiFonhLyS3oCH+3X2gm
	oIzP31B72zUbYgMQnuYb+kQhtlkC1eYf6EDfwQghbpJ2aIygpO3hF3Hm92zLf92dcSOf
	oJNsl988SzLgcbBRRATzZzhCOWDcFxonOYugM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Bco/DYcJdmwHsIjsciqOiramyp7piBDkmsCt7vVIrQyv5fcnPh7xh0tx1GPblxJYPs
	kEX9sp5PC2dWCqwf3knk/uryI+nSHSktmobyGO+S8eqWWkSfBk/XclfRsYqlnAwp/Tt+
	hQO9KmDBmiWqeaBQ8eShM857UMCXMp7MVxfR0=
Received: by 10.204.131.214 with SMTP id y22mr3189825bks.184.1281368906242; 
	Mon, 09 Aug 2010 08:48:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.71.8 with HTTP; Mon, 9 Aug 2010 08:48:06 -0700 (PDT)
In-Reply-To: <1281352360.16235.525.camel@rex>
References: <1281336254-11566-1-git-send-email-raj.khem@gmail.com> 
	<1281352360.16235.525.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Aug 2010 08:48:06 -0700
Message-ID: <AANLkTin_LwLx3V2C3tYPA03cxrAvu6w+h3VHZDSY0k7F@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
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
X-List-Received-Date: Mon, 09 Aug 2010 15:49:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 9, 2010 at 4:12 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> Hi Khem,
>
> On Sun, 2010-08-08 at 23:44 -0700, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =A0classes/cross.bbclass | =A0 =A08 ++++++++
>> =A01 files changed, 8 insertions(+), 0 deletions(-)
>>
>> diff --git a/classes/cross.bbclass b/classes/cross.bbclass
>> index cf14db1..64f7902 100644
>> --- a/classes/cross.bbclass
>> +++ b/classes/cross.bbclass
>> @@ -50,6 +50,14 @@ exec_prefix =3D "${prefix}"
>> =A0base_sbindir =3D "${base_prefix}/bin"
>> =A0sbindir =3D "${exec_prefix}/bin"
>>
>> +# staging should be special for cross
>> +STAGING_BINDIR =3D "${bindir}"
>> +STAGING_LIBDIR =3D "${libdir}"
>> +STAGING_INCDIR =3D "${includedir}"
>> +STAGING_ETCDIR =3D "${sysconfdir}"
>> +STAGING_DATADIR =3D "${datadir}"
>> +STAGING_SBINDIR =3D "${sbindir}"
>> +
>> =A0do_install () {
>> =A0 =A0 =A0 oe_runmake 'DESTDIR=3D${D}' install
>> =A0}
>
> Can you explain a bit more about why is this needed?

yes. for cross packages prefix is set in cross.bbclass to be
${base_prefix}${prefix_native}/${BASE_PACKAGE_ARCH}
which already points into native sysroot and bindir, datadir etc are
defined based on prefix in bitbake.conf so
for cross packages datadir already points to where it is in the final
install location of the cross packages.

but STAGING_* dirs are then defined like below

STAGING_DIR_HOST =3D "${STAGING_DIR}/${BASEPKG_HOST_SYS}"
STAGING_BINDIR =3D "${STAGING_DIR_HOST}${bindir}"

where
STAGING_DIR_HOST expands to <native sysroot> in the case of cross
packages because for them BASEPKG_HOST_SYS
is the build system itself. I think this is a the reason why we have
NATIVE_STAGING_* vars defined separately.
probably we should have the same set defined for cross too may be
something like CROSS_STAGING_* is one solution.

and now all these STAGING_* defines create another native sysroot
directory insise the existing one.
so I get /scratch/oe/sysroot/x86_64-linux/scrarch/oe/sysroot/x86_64-linux/u=
sr/armv5te/shared/
etc. paths while
building binutils-cross

because STAGING_* variables are used in autotools.bbclass

Thats why this patch

Thanks
-Khem

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


