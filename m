Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.4327.1585860213767087191
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Apr 2020 13:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: matthew.zeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 032KhVMZ006915
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 2 Apr 2020 13:43:31 -0700 (PDT)
Received: from mt-manjaro (128.224.21.163) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 2 Apr
 2020 13:43:30 -0700
References: <87o8sbf8e4.fsf@windriver.com>
 <CALbNGRSB_ZNW1qyFYuhTnR-eKCPo_oU5Bg+K4_UE5oiiCdXD=Q@mail.gmail.com>
 <871rp6t1jg.fsf@windriver.com>
 <21293c7f-669d-8153-2104-f9de823a7362@windriver.com>
 <CALbNGRQ1LqMOstdxGu4M4+sNUMj0-zabRePq0Z0Q3SNDpjj_2A@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 28.0.50
From: "Matthew" <matthew.zeng@windriver.com>
To: Randy MacLeod <randy.macleod@windriver.com>
CC: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>,
        <openembedded-devel@lists.openembedded.org>
Subject: Re: Regarding poppler auto PACKAGECONFIG when qt5-layer exists
In-Reply-To: <CALbNGRQ1LqMOstdxGu4M4+sNUMj0-zabRePq0Z0Q3SNDpjj_2A@mail.gmail.com>
Date: Thu, 2 Apr 2020 16:43:28 -0400
Message-ID: <87mu7tehzj.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.21.163]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable


Andreas M=C3=BCller <schnitzeltony@gmail.com> writes:

> On Thu, Apr 2, 2020 at 7:27 PM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>>
>> On 2020-04-02 10:17 a.m., Mingde (Matthew) Zeng wrote:
>> >
>> > Andreas M=C3=BCller <schnitzeltony@gmail.com> writes:
>> >
>> >> On Wed, Apr 1, 2020 at 7:02 PM Mingde (Matthew) Zeng
>> >> <matthew.zeng@windriver.com> wrote:
>> >>>
>> >>> Hello,
>> >>>
>> >>> In meta-oe/recipes-support/poppler/poppler_0.85.0.bb line 17, there =
is the line
>> >>>
>> >>>      PACKAGECONFIG ??=3D "jpeg openjpeg png tiff nss ${@bb.utils.con=
tains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)}"
>> >>>
>> >>> Let's say I add meta-qt5 to bblayers.conf, but I don't plan to use i=
t immediately in a build. Therefore I haven't make any additional change to=
 local.conf.
>> >>>
>> >>> However I will be receiving the following error when starting a buil=
d:
>> >>>
>> >>>      WARNING: qtbase is not whitelisted, figuring out PNWHITELIST...
>> >>>      ERROR: Nothing PROVIDES 'qtbase' (but .../meta-openembedded/met=
a-oe/recipes-support/poppler/poppler_0.85.0.bb DEPENDS on or otherwise requ=
ires it)
>> >> Guess I know how this is going to end so just out of curiosity: What
>> >> configuration is causing 'qtbase is not whitelisted' ?
>> >
>> > This is the problem. I don't have any configuration in local.conf rela=
ted to qt5, because I don't plan to use it in my build. It is only in bblay=
ers.conf so I can use qt5 layer when I feel necessary.
>>
>> Mathew is building xfce using the whitelist bbclass that some people
>> use. When he added meta-qt5 and whitelisted a few recipes, the
>> build broke. I don't object to adding changing how poppler works
>> when qt is present but by default as Matthew said, adding a layer
>> should not change anything. On the other hand, I can understand how
>> it would be very convenient to have the dependencies and configuration
>> change automatically. Could the be a tunable that is off by default?
>> The obvious downside to such an approach is testing but the
>> PACKAGECONFIGs already suffer from lack of testing so this only makes
>> it incrementally less tested! ;-)
>>
>>
>> There are only two such dynamic package configurarations in meta-oe:
>> $ grep -r BBFILE_COLLECTIONS | grep "PACKAGECONFIG "
>> meta-oe/recipes-support/poppler/poppler_0.85.0.bb:PACKAGECONFIG ??=3D
>> "jpeg openjpeg png tiff nss ${@bb.utils.contains('BBFILE_COLLECTIONS',
>> 'qt5-layer', 'qt5', '', d)}"
>> meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb:PACKAGECONF=
IG
>> ?=3D "libpcap gnutls libnl libcap sbc
>> ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5 plugins',
>> '', d)}"
>>
>>
>> and the only other such usage that I have in the meta-foo layers in my
>> local collection is:
>> meta-security/meta-tpm/recipes-tpm/swtpm/swtpm_0.2.0.bb:PACKAGECONFIG +=
=3D
>> "${@bb.utils.contains('BBFILE_COLLECTIONS', 'filesystems-layer', 'cuse',
>> '', d)}"
>>
>> so fixing this isn't a huge impact.
>>
>> Matthew,
>> If Andreas agrees, please send a patch removing this behaviour
>> unless someone replies this week, providing a mechanism and a
>> local.conf setting to make it configurable.

Sounds good, let's see if there is an alternative mechanism.

>>
>> ../Randy
> Ahh - thanks for explanation. Send out whatever is 'correct' I won't
> complain and find a way to not break the qt-based pdf readers /
> poppler consumers.
>
> Andreas


--
Mingde (Matthew) Zeng
