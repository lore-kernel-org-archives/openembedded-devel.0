Received: from mail-we0-f182.google.com ([74.125.82.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sankar.m@hardcube.in>) id 1U6J7J-0006ju-1a
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2013 12:06:09 +0100
Received: by mail-we0-f182.google.com with SMTP id t57so2787886wey.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2013 02:50:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:x-originating-ip:in-reply-to:references
	:date:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=gfuxOiIMymOLPTAMHlx4ILOhH9JZz1/6bQ0m9iE4INQ=;
	b=oULgsMFXCj1LoMa6d3neFb5EhxBkApF3F1s3rDPgcXdDfHEi4qnAkM/iSBgVCui4P0
	KHCRaDJaK1Z78UR1BcNovA8EexTLYlgPk61XBftEyTLr7pq21X/6kuzvTTu0KpZ8RnjF
	u3T101D/eug866fOXrmqzcye1ob/E+yh83+0ZbNpwTmfB2JaSwgJSwTuWCkYWHUX2g9t
	j7IHY0VZfozMR1136NPg4e/zrQq0uUk54/Eoxpk2fm8SmNl0bDm4zUO0MN/CN7ZljdTq
	jGEg7nYmgjvGvwJ3NHmWaQANetK8tv7h/YghXGiKAtUs2Vt9J8Y2EUcX+XrauST2qfmz
	h3JQ==
MIME-Version: 1.0
X-Received: by 10.180.83.10 with SMTP id m10mr5140864wiy.5.1360925404989; Fri,
	15 Feb 2013 02:50:04 -0800 (PST)
Received: by 10.216.32.133 with HTTP; Fri, 15 Feb 2013 02:50:04 -0800 (PST)
X-Originating-IP: [203.193.158.21]
In-Reply-To: <CAJTo0LaESjBTOXzxQzQm5KxkQqOi8HnKgJxxjr99mNWTbbeVog@mail.gmail.com>
References: <CAKSKmM3AKfssEKaJ6ndb5v9On73Yi6WW9b99h6biHtD=8xS6Aw@mail.gmail.com>
	<511CAFF3.3090004@communistcode.co.uk>
	<CAKSKmM3vHzj_-Jh1MP1SZxxsCYe212NdnWApHvmn6CVJPXOMsA@mail.gmail.com>
	<511CB7DD.4080407@communistcode.co.uk>
	<CAKSKmM3keR3GKfvT5_VFvL101RBjbwfS4=ugV=yodWfBRfzs4w@mail.gmail.com>
	<CAJTo0LbBSzhFyghuTRrbeb5bpL4oB7DO=2i3GMc_CTtpxTzq2g@mail.gmail.com>
	<CAKSKmM2NNdci6kCtaxnWDgApkFerkTDYFGy78-XddG9N8xqBGw@mail.gmail.com>
	<CAJTo0LaESjBTOXzxQzQm5KxkQqOi8HnKgJxxjr99mNWTbbeVog@mail.gmail.com>
Date: Fri, 15 Feb 2013 16:20:04 +0530
Message-ID: <CAKSKmM2bC1C65ca2RZcKvz3yTEM_9+yHFq95yMD+hJPWpYziCA@mail.gmail.com>
From: Sankar H Malarmani <sankar.m@hardcube.in>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlU2Q7XVFMlfAB7qIp6pYy3cmJOBjfiScS2mMsu4f4awkpgEk0bpjqTUk7dlnFze2VtM+/K
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
X-List-Received-Date: Fri, 15 Feb 2013 11:06:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I changed RRECOMMENDS the way you suggested..

May I know how to resolve the following errors..

ERROR: Unable to parse /home/hc/oe-core/build/../
stuff/openembedded-core/meta/recipes-connectivity/wpa-supplicant/
wpa-supplicant_2.0.bb
Traceback (most recent call last):
  File "/home/hc/oe-core/stuff/
openembedded-core/bitbake/lib/bb/utils.py", line 284, in
better_exec(code=3D<code object <module> at 0xbf64068, file "<code>", line
1>, context=3D{'d': <bb.data_smart.DataSmart object at 0x86d0fec>},
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

Thanks in advance.


On Fri, Feb 15, 2013 at 4:01 PM, Burton, Ross <ross.burton@intel.com> wrote=
:

> On 15 February 2013 05:30, Sankar H Malarmani <sankar.m@hardcube.in>
> wrote:
> > Yes, you are right.. I removed those trailing slashes and now it throws
> me
> > new set of errors.. It was giving errors in RDEPENDS..
> > As suggested in wiki I replaced RDEPENDS with RRECOMMENDS in my
> > obconf_2.0.3+git.bb. But i'm getting the following list of errors.
>
> In the last week or so oe-core was changed to warn if you specify
> RDEPENDS or RRECOMMENDS without a package identifier.  For example,
> this is wrong:
>
> RRECOMMENDS =3D "foo"
>
> But this is right:
>
> RRECOMMENDS_obconf =3D "foo"
>
> Ross
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

