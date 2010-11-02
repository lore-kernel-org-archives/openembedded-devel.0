Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PD8hh-0008VG-UE
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 05:42:57 +0100
Received: by ywo32 with SMTP id 32so3944419ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 21:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=nbkGDMgKpCoEL32xOJGsNLTbtVCAiaBgAcud/dW8f1U=;
	b=MxJyBEmDbOBRfmZuhrVHiwlXS2qypo0IW5vuqawB+SD+PPT6lJmXbklTdg0a3YHBQ/
	/xdAizZJqoKsDceEFynie59Ngx48IyMYw4RLx+SFskh942LyvE1jcx2aOF92nwS6QYQZ
	n0PtaP2eRJ7k6YhTxZALtk0T087UWAmB5s5do=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=qU2aZXp5bLdWiz43INN9Opk6E9UOd/beCKK6y379Ju+vtD4JUREMPcOC0KBKrdOHt5
	CzG1fRfK6xGcVMlcqK8M7eTQqXxk0n0piBCnwQCP8iaMYdgkyyMJcergNZ2HVlevRF8w
	01nZCrNSPyuKrExmvLzfmiLUVoArTJcfKJGeQ=
Received: by 10.91.27.32 with SMTP id e32mr821561agj.37.1288672907474; Mon, 01
	Nov 2010 21:41:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Mon, 1 Nov 2010 21:41:27 -0700 (PDT)
In-Reply-To: <1288646991-15775-1-git-send-email-eric@eukrea.com>
References: <1288646991-15775-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Nov 2010 21:41:27 -0700
Message-ID: <AANLkTi=0EsyQ38D1dyBRffGBWEoVo==6=H9+wrtcENyR@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gdb-cross-sdk: don't reconfigure after making changes in gdb/Makefile
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
X-List-Received-Date: Tue, 02 Nov 2010 04:42:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 1, 2010 at 2:29 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> else we don't statically link libncurses, libtinfo and libz which leads
> to :
> /usr/local/angstrom/arm/bin/arm-angstrom-linux-gnueabi-gdb:
> error while loading shared libraries: libtinfo.so.5:
> cannot open shared object file: No such file or directory
>
> when trying to use the toolchain.

could you run oe_runconf and then do the Makefile editing ? that way
it will work as expected.
we sort of need oe_runconf

>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> ---
> =C2=A0recipes/gdb/gdb-cross-sdk.inc | =C2=A0 =C2=A01 -
> =C2=A01 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/gdb/gdb-cross-sdk.inc b/recipes/gdb/gdb-cross-sdk.in=
c
> index 6a708ca..d32111f 100644
> --- a/recipes/gdb/gdb-cross-sdk.inc
> +++ b/recipes/gdb/gdb-cross-sdk.inc
> @@ -16,5 +16,4 @@ do_configure_append () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for SIM in ${B}/sim/*/Makefile; do
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ -f $SIM ] && sed=
 -e 's,-lz, ${STAGING_LIBDIR_NATIVE}/libz.a ,g' -i $SIM
> =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> - =C2=A0 =C2=A0 =C2=A0 oe_runconf
> =C2=A0}
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


