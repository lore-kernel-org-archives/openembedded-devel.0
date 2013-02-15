Received: from mail-wg0-f53.google.com ([74.125.82.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sankar.m@hardcube.in>) id 1U6Ey8-00073B-3L
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2013 07:40:24 +0100
Received: by mail-wg0-f53.google.com with SMTP id fn15so2441665wgb.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2013 22:24:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:x-originating-ip:in-reply-to:references
	:date:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=TGfChI1R+kyhZp6jqItAYBKcDd/G3hVY778l/MO+rJo=;
	b=i+cFj7Zbt6es+4Sp1brCTI3QmNAKvO4NJqgXTXatalCN3Tv5v24MHvUMR87kJYSdLt
	GkrruBFswuwhlm1AZuy3RJyCOMnYAPlCFTcj04r4Ie2cXBZoIbrCGoXqlAdXtNS3jL0g
	7+SP1R6f+csSm8X3mwco776Ude19K6kqhnxSemCXuoa2GNk6nwvDxCI8A9pspdV17ZnZ
	tyuXAprvEEk2tFzOduN+5GklAhJkSN6v2LtuYfTkqMpEUJsbV5v+DUkU1wpJ5S83O5CD
	+sU3YK+873hYSJkc43aF2/Andgga+R/LiI1mJcl8B95SHpbXabk+K1omu6KTp8WgswtT
	Id6Q==
MIME-Version: 1.0
X-Received: by 10.180.83.227 with SMTP id t3mr2049411wiy.2.1360909460900; Thu,
	14 Feb 2013 22:24:20 -0800 (PST)
Received: by 10.217.3.136 with HTTP; Thu, 14 Feb 2013 22:24:20 -0800 (PST)
X-Originating-IP: [203.193.158.21]
In-Reply-To: <CAJTo0LbBSzhFyghuTRrbeb5bpL4oB7DO=2i3GMc_CTtpxTzq2g@mail.gmail.com>
References: <CAKSKmM3AKfssEKaJ6ndb5v9On73Yi6WW9b99h6biHtD=8xS6Aw@mail.gmail.com>
	<511CAFF3.3090004@communistcode.co.uk>
	<CAKSKmM3vHzj_-Jh1MP1SZxxsCYe212NdnWApHvmn6CVJPXOMsA@mail.gmail.com>
	<511CB7DD.4080407@communistcode.co.uk>
	<CAKSKmM3keR3GKfvT5_VFvL101RBjbwfS4=ugV=yodWfBRfzs4w@mail.gmail.com>
	<CAJTo0LbBSzhFyghuTRrbeb5bpL4oB7DO=2i3GMc_CTtpxTzq2g@mail.gmail.com>
Date: Fri, 15 Feb 2013 11:54:20 +0530
Message-ID: <CAKSKmM1yU=65LnW_u3vh6N4e65rUW-iwL1K4Lztx8rUbwOGu_g@mail.gmail.com>
From: Sankar H Malarmani <sankar.m@hardcube.in>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkCs5HaO493DIOyprWZE+DD1J2b4ixr4qRlHofYmwtrlCKEBnWyXU4Zkqoc4pXd/wbWQl7L
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: gtk errors in openembedded classis build
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
X-List-Received-Date: Fri, 15 Feb 2013 06:40:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I think I'm getting nearer... I appreciate the support you offered till
now..

I cleaned the bitbake and rebuilt it. Now RRECOMMENDS error is not there..

These are the errors I'm dealing with now..

ERROR: Unable to parse
/home/hc/oe-core/build/../stuff/openembedded-core/meta/recipes-connectivity=
/wpa-supplicant/
wpa-supplicant_2.0.bb
Traceback (most recent call last):
  File "/home/hc/oe-core/stuff/openembedded-core/bitbake/lib/bb/utils.py",
line 284, in better_exec(code=3D<code object <module> at 0xbf64068, file
"<code>", line 1>, context=3D{'d': <bb.data_smart.DataSmart object at
0x86d0fec>},
text=3D'__anon_620__home_hc_oe_core_build____stuff_openembedded_core_meta_c=
lasses_base_bbclass(d)\n__anon_20__home_hc_oe_core_build____stuff_openembed=
ded_core_meta_classes_debian_bbclass(d)\n__anon_20__home_hc_oe_core_build__=
__stuff_openembedded_core_meta_classes_blacklist_bbclass(d)\n__anon_227__ho=
me_hc_oe_core_build____stuff_openembedded_core_meta_classes_package_bbclass=
(d)\n__anon_916__home_hc_oe_core_build____stuff_openembedded_core_meta_clas=
ses_insane_bbclass(d)\n__anon_76__home_hc_oe_core_build____stuff_openembedd=
ed_core_meta_classes_sstate_bbclass(d)\n__anon_474__home_hc_oe_core_build__=
__stuff_openembedded_core_meta_classes_package_ipk_bbclass(d)\n__anon_83__h=
ome_hc_oe_core_build____stuff_meta_openembedded_meta_systemd_classes_system=
d_bbclass(d)',
realfile=3D'<code>'):
         try:
    >        exec(code, _context, context)
         except Exception as e:
  File "<code>", line 8, in <module>
  File
"__anon_83__home_hc_oe_core_build____stuff_meta_openembedded_meta_systemd_c=
lasses_systemd_bbclass",
line 2, in
__anon_83__home_hc_oe_core_build____stuff_meta_openembedded_meta_systemd_cl=
asses_systemd_bbclass(d=3D<bb.data_smart.DataSmart
object at 0x86d0fec>)
  File "systemd.bbclass", line 42, in
systemd_after_parse(d=3D<bb.data_smart.DataSmart object at 0x86d0fec>)
  File "systemd.bbclass", line 12, in systemd_check_vars
FuncFailed: Function failed:

/home/hc/oe-core/build/../stuff/openembedded-core/meta/recipes-connectivity=
/wpa-supplicant/
wpa-supplicant_2.0.bb inherits systemd but doesn't set SYSTEMD_PACKAGES
ERROR: Command execution failed: Exited with 1
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.



And this is what I have in wpa-supplicant_2.0.bb file.

require wpa-supplicant-2.0.inc

PR =3D "r0"

SRC_URI[md5sum] =3D "3be2ebfdcced52e00eda0afe2889839d"
SRC_URI[sha256sum] =3D
"2c115609fbb5223d51381084a5c944455a8afcda81d584173ff55ba233379e09"

Any help would be much appreciated.

On Thu, Feb 14, 2013 at 8:13 PM, Burton, Ross <ross.burton@intel.com> wrote=
:

> On 14 February 2013 10:32, Sankar H Malarmani <sankar.m@hardcube.in>
> wrote:
> > ERROR: There is a confusing multiline, partially commented expression o=
n
> > line 45 of file
> /home/hc/oe-core/build/../stuff/meta-toradex/recipes/images/
> > angstrom-lxde-image.bb ().
> > Please clarify whether this is all a comment or should be parsed.
>
> This means that there is a confusing multiline comment on line 45.
> This normally means this:
>
> # this is a comment \
>
> The trailing slash is ambiguous, so remove it.
>
> Ross
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Thanks & Regards
*Sankar*

