Received: from mail-wi0-f174.google.com ([209.85.212.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sankar.m@hardcube.in>) id 1U6E7h-0005IS-Da
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2013 06:46:15 +0100
Received: by mail-wi0-f174.google.com with SMTP id hi8so698670wib.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2013 21:30:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:x-originating-ip:in-reply-to:references
	:date:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=wI+ajvpGvMwznS0LK2ocQ/I24OJT7D7R9iXOx6XDkUE=;
	b=kagUK9Oh4mXy73nuVJqy5WlVZ/Fij9xfnr/0g/7f3mPKoAlrZWr95RonMFdetunexO
	+CSc0CM8O159WPhZBJ8/TZ4+5Qiwzno423JC08ZxRk0dnzcwWmMZDP08tZAs7uFHpruq
	qANXiXRKd2U3CWUrfubwwIZFN1sLO9duh5E0HWeFFNtWta4b5jwfvV1FGeHgg1lf7Sym
	tO+Q4vWIaE7kgaLtHrxNs6ZrrmLQixBzmkHKuxoYRLM1mI+K5bmBsvbvcsqYznfUh0/H
	5iyCJ5yqPQqaNCCN9Ys2p6ejf1DdLTIw7ExOcB6EQ6nPSqwDRsYpvzAWlcv0fRMYpFN9
	nhwA==
MIME-Version: 1.0
X-Received: by 10.194.76.237 with SMTP id n13mr1710760wjw.57.1360906210005;
	Thu, 14 Feb 2013 21:30:10 -0800 (PST)
Received: by 10.217.3.136 with HTTP; Thu, 14 Feb 2013 21:30:09 -0800 (PST)
X-Originating-IP: [203.193.158.21]
In-Reply-To: <CAJTo0LbBSzhFyghuTRrbeb5bpL4oB7DO=2i3GMc_CTtpxTzq2g@mail.gmail.com>
References: <CAKSKmM3AKfssEKaJ6ndb5v9On73Yi6WW9b99h6biHtD=8xS6Aw@mail.gmail.com>
	<511CAFF3.3090004@communistcode.co.uk>
	<CAKSKmM3vHzj_-Jh1MP1SZxxsCYe212NdnWApHvmn6CVJPXOMsA@mail.gmail.com>
	<511CB7DD.4080407@communistcode.co.uk>
	<CAKSKmM3keR3GKfvT5_VFvL101RBjbwfS4=ugV=yodWfBRfzs4w@mail.gmail.com>
	<CAJTo0LbBSzhFyghuTRrbeb5bpL4oB7DO=2i3GMc_CTtpxTzq2g@mail.gmail.com>
Date: Fri, 15 Feb 2013 11:00:09 +0530
Message-ID: <CAKSKmM2NNdci6kCtaxnWDgApkFerkTDYFGy78-XddG9N8xqBGw@mail.gmail.com>
From: Sankar H Malarmani <sankar.m@hardcube.in>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlG0Coteh/mRB32j1GsHc0sTSR081dwrp8ED5LDhSoptmBh58qapI9AQI255KplPKCx4KeC
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
X-List-Received-Date: Fri, 15 Feb 2013 05:46:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Yes, you are right.. I removed those trailing slashes and now it throws me
new set of errors.. It was giving errors in RDEPENDS..
As suggested in wiki I replaced RDEPENDS with RRECOMMENDS in my
obconf_2.0.3+git.bb. But i'm getting the following list of errors.


ERROR: QA Issue:
/home/hc/oe-core/build/../stuff/oe-tworaz/meta-lxde/recipes-lxde/obconf/obc=
onf_2.0.3+
git.bb: Variable RRECOMMENDS is set as not being package specific, please
fix this.
ERROR: Unable to parse
/home/hc/oe-core/build/../stuff/openembedded-core/meta/recipes-connectivity=
/wpa-supplicant/
wpa-supplicant_2.0.bb
Traceback (most recent call last):
  File "/home/hc/oe-core/stuff/openembedded-core/bitbake/lib/bb/utils.py",
line 284, in better_exec(code=3D<code object <module> at 0xc07ab60, file
"<code>", line 1>, context=3D{'d': <bb.data_smart.DataSmart object at
0xc071a0c>},
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
object at 0xc071a0c>)
  File "systemd.bbclass", line 42, in
systemd_after_parse(d=3D<bb.data_smart.DataSmart object at 0xc071a0c>)
  File "systemd.bbclass", line 12, in systemd_check_vars
FuncFailed: Function failed:

/home/hc/oe-core/build/../stuff/openembedded-core/meta/recipes-connectivity=
/wpa-supplicant/
wpa-supplicant_2.0.bb inherits systemd but doesn't set SYSTEMD_PACKAGES

ERROR: Command execution failed: Exited with 1

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
*Junior Programmer
*
*
*
*HardCube IT Consultancy Private Limited*
*II Floor , STPI - Software Technology Parks of India*
*5 Rajiv Gandhi Salai*
*Taramani, Chennai 600 113*
*Ph: 91 - 44 - 3918 0857*
*info@hardcube.in*
*http://www.hardcube.in*
**************
*"The contents of this E-mail (including the contents of the enclosure/(s)
or attachment/(s) if any) are privileged and confidential material of
HardCube IT Consultancy Private Limited, and should not be disclosed to,
used by or copied in any manner by anyone other than the intended
addressee/(s).If this E-mail (including the enclosure/(s) or attachment/(s)
if any) has been received in error, please advice the sender immediately
and delete it from your system. The views expressed in this E-mail message
(including the enclosure/(s) or attachment/(s) if any) are those of the
individual sender, except where the sender expressly, and with authority,
states them to be the views of "HardCube"."*
***************

