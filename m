Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36609.1793164206187990684
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 22:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Bv7skgsM;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8aea7b7ca0cso4143577b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 22:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793164205; cv=none;
        d=google.com; s=arc-20260327;
        b=XOYT6zyend8DnrKLfrtdatraD5tzQIP3LAdTOLoCwq5o7n12LQvYUXRyQye0uby2TP
         MsgHl3R4RPmUvmzxBFbd4j5DE5V3bYvXKgigasjHQrdcANar3EyyzWBjYQEadCU3i4/q
         VsFLcmOyDhZk6pFBPlI3473uCsJfhx5P54B7TMxhK7PQ3tvIX8RzUfZvKVjAZtmlj6D+
         C19EXDMUcSESu9uVP8p89eeeKIslKFXSxpJOgPLwo1rLLxKLEiRh5KP/r4ALIuw7DhJQ
         1pHuGRmBW4iMHt+a2KzuSZ4+v3iKrG5DUer0rpMmo3NYUTo3zk3KQzDFJnaDvNBQ+Ww4
         /9JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pzw+zadOFUG3IxMdfpF02xx230zOoCfOBAnsiIKXgLc=;
        fh=dpTQ50HoTzx2UkeI0xE3gTGvn0ykWoKmvzg3q+3VukE=;
        b=nuQOQ5XbWsiou8jl/iJolyRDMJTvBP19BpYHDmABH4gHS8oOIy5SymteF00gbFcWCJ
         l9BHR2IsSyp5kBigS/zoAoI27xZ9tlVQboUr+ivcjBmONiT2IL2KYTnr3QrkPZRRA1Cy
         DevOH9M2j3Q1yKlGNi6iXe+0aEx1aCasQ6S2qjztmp2ZPqM2tEK+01lbEnwpe9rRPMnL
         4gEzpxZU18AIlA123g3dowRweKkKBMEh9ljy9Uo25YBGl8mF/gFB0jmmDKc2vR38LWFn
         8jK5lMb2b2RA0dCk/gJq5cW5LJ2wPwI0iQ3C/vRdPRoWV/e0sziHFvufeSzVKYLCYQJV
         b93A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793164205; x=1793769005; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pzw+zadOFUG3IxMdfpF02xx230zOoCfOBAnsiIKXgLc=;
        b=Bv7skgsMxCRfp78/kZBGzV3fN4EvTnUYZusPZoj4+5ovvwx7O2Zkjov8BKTJG3gg+L
         TPoMSso+LxafTO9mWDoyBAkEPqvQxZHHl1jTAV/Ud7iDu4vvBduaSKTH7kLbZat4+lyk
         MbDDUeRP6rshMu8sewnPRKzDNGCN9Xy838dvifJiRPTyYML9WFzWtbk2R8URw2psQ+vb
         +LhSi+aAGbdwKBtVKj4Ykyl5NitBzAT4jB/DPPNhEQ7ckAPLzEBv/7NIRLdZEept6+y5
         nIpv2earJLrPZOJUPvDDzGb4AZvwLT/vmbBfYseY927wpTlYqJDVUAxeEKkIWjZf2wFP
         P9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793164205; x=1793769005;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pzw+zadOFUG3IxMdfpF02xx230zOoCfOBAnsiIKXgLc=;
        b=1F4XPRaVjdECkBA4JmhHSv+kqeGyztUcC0SAsJvEMVDkuDgxbwkFJ2Gx+PFKqqMSug
         6RR2V5Y5H8ze41l7pO1QS6/C1mPblSOffKCIzPtaD87lzdnjh/WccslmtPAytvtxHk8M
         Rd2XDdQWYpqAbt5iHy4PpYi9GXMsMPMEXP+GjzyXbuZB8IbqvM0B1ZjCGA1/vfbBuLps
         oZr82rS5qZHiRLWxe9KgwNg72XmsPBHGnrGABb1PGxhaw+mu/DhEyLtZCvf/5Wdm60Uv
         XRkrds3Ad4Nt5j2K72/s2b2NXMTvb/hjqWOrI2kLDytfOBHS7okOsaynL1mLLKgXlgCW
         L0HQ==
X-Gm-Message-State: AFq9FYI1Fj+495tq2HnRQ8W1Y7kJ9NNiXdKACSVQoLFmY/tiLH25iJUA
	SiQ7Jcyd/zwVsA01koZ6PAlCkY/oOgZUT472iuGBRwwY+Q53OIP5qbKFRoowmKEYGelUcF45xxN
	Nrev+JUWNJDbslv6+ijY6VFUL3qGGB2s=
X-Gm-Gg: AYBFou3CeEQ2pjvSOGQW6BvKGqGrojBOWHZD/XV5Wk1lrTOhC6hnPBOVYpxWktBeTPQ
	1JHV6c5z5xvBHerfEk8xBuApQ8a6vMdf5YMW4Vh759YxJvl6JEjC1ioVH19a348eK3m+RR0oQ6Z
	rMQCizWBO+a5BnWLUov9gKtMxSR/9aRQrZ+uqfHtSJw3TDEoQzt/W55IFM2thj8vCp8Nmev5fw5
	8jPe72n7eUR/E5WEYLO6pIEF2q1s4gDF/GakbOL9waUmbeoprZTh+AklL75d7brjTuNdy3pfiyO
	jQHLwh806iFFL9ER1C4TttyucDiv88BwxLtQZzjC4N2wO3sDBCcslrs47v6IY51cE5mHgEkxzR+
	fDyDKyZN7aA+a7AWVoCEJkQDxSD+R5kW6WHA03hB10SEH1qqfmG9d8+fDttrcG87mfC4ccJ9rmj
	bCqYxuDrnByovRQ/pqsI0G+QC9uRfwCI5Wj5wV9VJFuru3UESuRrZfdmz+IpCsyvoW9hkmF1qpi
	SO1WZ8K74AG2pWtPIDn0IZZpUTck3Ynknplc4PzyqjR9hklRAgKtdctIBZ2V72bBfPvXiZNhppx
	luT4R13LfY2amVwODhxRnxEVlZKFvE18liyDyyTq5AR+k03hIVTgpM8ECXNMIqBxdoQvAHJ6Eo7
	0pSD7ng9yF5zu7xhymNVLAGumsF/DrNAmC5vjyO2NhMY=
X-Received: by 2002:a05:690c:498f:b0:882:309e:fcaa with SMTP id
 00721157ae682-8b1b5b5b831mr7970927b3.15.1793164204826; Tue, 27 Oct 2026
 22:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Oct 2026 22:09:38 -0700
X-Gm-Features: AclHuK9WsPTMZC7HNOFDIeoOnmQpepBOL2m2WU0GH7pbx33L_liSMiEx2-gyzy0
Message-ID: <CAMKF1srjUDJQ5GfHHNXDu+sUdNLSNSOgO_7PdnDkEyWuHkF_TA@mail.gmail.com>
Subject: Re: [oe] [blacksail][PATCH 00/60] Blacksail pull request
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Peter Marko <peter.marko@siemens.com>, Khem Raj <khem.raj@oss.qualcomm.com>, 
	Jason Schonberg <schonm@gmail.com>, James Lee <james@codeconstruct.com.au>
Content-Type: multipart/alternative; boundary="00000000000073e547065edf93db"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 05:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131613

--00000000000073e547065edf93db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged now, thanks Ankur

On Tue, Oct 27, 2026 at 9:23=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Please merge these changes in blacksail. Tested locally and on autobuilde=
r.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1904
>
> The following changes since commit
> a9d69bc066bf9498397db27902c287dd666fdfd4:
>
>   lvgl-demo-fb: fix SRCREV (2026-10-14 09:26:03 +1300)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib ankurt/blacksail
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dankurt/bl=
acksail
>
> for you to fetch changes up to bb956bf8ff7a32f31deaa83e96880d10ab564d14:
>
>   redis: upgrade 8.10.2 -> 8.10.3 (2026-10-28 08:22:29 +1300)
>
> ----------------------------------------------------------------
>
> Ankur Tyagi (51):
>   zeroconf: ignore CVEs
>   udisks2: patch CVE-2026-7867
>   tmate: patch CVE-2026-4751
>   tinyproxy: patch CVE-2026-54388
>   flatpak: upgrade 1.18.0 -> 1.18.4
>   xdg-dbus-proxy: upgrade 0.1.7 -> 0.1.9
>   swagger-ui: upgrade 5.33.1 -> 5.33.2
>   freerdp3: upgrade 3.32.1 -> 3.32.2
>   spitools: upgrade 1.1.0 -> 1.1.1
>   libspdm: upgrade 3.8.2 -> 3.8.3
>   libmikmod: upgrade 3.3.14 -> 3.3.15
>   libxmp: upgrade 4.7.3 -> 4.7.4
>   python3-pyjwt: upgrade 2.13.0 -> 2.14.0
>   python3-cbor2: upgrade 6.1.4 -> 6.1.5
>   samba: ignore CVE-2026-2340
>   rapidjson: mark CVE-2024-38517 fixed
>   psqlodbc: patch CVE-2026-109448
>   proftpd: mark CVE-2026-53994 fixed
>   postfix: ignore CVE-2023-32182
>   poppler: patch CVE-2026-102621
>   poppler: patch CVE-2026-102620
>   opensc: patch CVE-2026-103531
>   pjproject: mark CVE-2026-26967 fixed
>   pjproject: patch CVE-2026-57160
>   pjproject: patch CVE-2026-57161
>   pjproject: patch CVE-2026-57162
>   pjproject: patch CVE-2026-57163
>   pjproject: patch CVE-2026-57164
>   pjproject: patch CVE-2026-57165
>   pjproject: patch CVE-2026-57166
>   pjproject: patch CVE-2026-77396
>   pjproject: patch CVE-2026-84975
>   nmap: patch CVE-2026-58058
>   nmap: patch CVE-2026-72712
>   netdata: mark CVE-2026-83602 fixed
>   mtr: patch CVE-2026-14461
>   ncp: ignore CVE-2025-14577 and CVE-2026-35087
>   libvncserver: patch CVE-2026-44988
>   libvncserver: patch CVE-2026-32854
>   libvncserver: patch CVE-2026-32853
>   libvncserver: patch CVE-2026-50538
>   swagger-ui: upgrade 5.33.2 -> 5.33.3
>   libmspack: patch CVE-2026-110602
>   unbound: upgrade 1.26.1 -> 1.26.2
>   ntpsec: upgrade 1.2.5 -> 1.2.6
>   apache2: upgrade 2.4.68 -> 2.4.69
>   7zip: upgrade 26.03 -> 26.04
>   7zip: upgrade 26.04 -> 26.05
>   python3-brotli: upgrade 1.2.0 -> 1.2.1
>   python3-oauthlib: patch CVE-2026-49265
>   redis: upgrade 8.10.2 -> 8.10.3
>
> James Lee (1):
>   mctp: upgrade 2.6 -> 2.6.1
>
> Jason Schonberg (3):
>   brotli: upgrade 1.2.0 -> 1.2.1
>   php: upgrade 8.5.11 -> 8.5.12
>   c-ares: backport security fixes from 1.34.9
>
> Peter Marko (5):
>   nginx: upgrade 1.30.5 -> 1.30.6
>   nginx: set CVE_STATUS for CVE-2026-95101 and CVE-2026-97629
>   nss: remove compromised eMudhra certificates
>   grpc: update gRPC repo roots
>   python3-grpcio: update gRPC repo roots
>
>  .../pjproject/pjproject/CVE-2026-57160.patch  |    42 +
>  .../pjproject/pjproject/CVE-2026-57161.patch  |    49 +
>  .../pjproject/pjproject/CVE-2026-57162.patch  |    43 +
>  .../pjproject/pjproject/CVE-2026-57163.patch  |    52 +
>  .../pjproject/pjproject/CVE-2026-57164.patch  |    66 +
>  .../pjproject/pjproject/CVE-2026-57165.patch  |    85 +
>  .../pjproject/pjproject/CVE-2026-57166.patch  |   228 +
>  .../pjproject/pjproject/CVE-2026-77396.patch  |    74 +
>  .../pjproject/pjproject/CVE-2026-84975.patch  |    87 +
>  .../pjproject/pjproject_2.17.bb               |    11 +
>  .../samba/samba_4.23.11.bb                    |     1 +
>  .../recipes-daemons/postfix/postfix_3.11.7.bb |     2 +
>  .../recipes-daemons/proftpd/proftpd_1.3.9d.bb |     1 +
>  .../zeroconf/zeroconf_0.9.bb                  |     6 +
>  meta-networking/recipes-support/mctp/mctp.inc |     4 +-
>  .../mctp/{mctp_2.6.bb =3D> mctp_2.6.1.bb}       |     0
>  .../mctp/{mctpd_2.6.bb =3D> mctpd_2.6.1.bb}     |     0
>  .../mtr/mtr/CVE-2026-14461.patch              |    32 +
>  .../recipes-support/mtr/mtr_0.96.bb           |     4 +-
>  .../recipes-support/ncp/ncp_1.2.4.bb          |     3 +
>  .../{ntpsec_1.2.5.bb =3D> ntpsec_1.2.6.bb}      |     2 +-
>  .../tinyproxy/tinyproxy/CVE-2026-54388.patch  |    32 +
>  .../tinyproxy/tinyproxy_1.11.3.bb             |     1 +
>  .../{unbound_1.26.1.bb =3D> unbound_1.26.2.bb}  |     2 +-
>  .../psqlodbc/files/CVE-2026-109448.patch      |   243 +
>  .../psqlodbc/psqlodbc_18.00.0002.bb           |     1 +
>  ...curity-Update-gRPC-repo-roots.-43699.patch |  2617 +++
>  meta-oe/recipes-devtools/grpc/grpc_1.84.0.bb  |     1 +
>  .../php/{php_8.5.11.bb =3D> php_8.5.12.bb}      |     2 +-
>  .../rapidjson/rapidjson_git.bb                |     2 +
>  .../7zip/{7zip_26.03.bb =3D> 7zip_26.05.bb}     |     2 +-
>  .../{brotli_1.2.0.bb =3D> brotli_1.2.1.bb}      |     4 +-
>  .../{flatpak_1.18.0.bb =3D> flatpak_1.18.4.bb}  |     4 +-
>  ...-hiredis-use-default-CC-if-it-is-set.patch |     0
>  ...ile-to-use-environment-build-setting.patch |     0
>  ...003-hack-to-force-use-of-libc-malloc.patch |     0
>  .../0004-src-Do-not-reset-FINAL_LIBS.patch    |     0
>  ...RCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |     0
>  ...-not-build-the-test-modules-from-all.patch |     0
>  .../init-redis-server                         |     0
>  .../{redis-8.10.2 =3D> redis-8.10.3}/redis.conf |     0
>  .../redis.service                             |     0
>  .../{redis_8.10.2.bb =3D> redis_8.10.3.bb}      |     2 +-
>  .../tmate/files/CVE-2026-4751.patch           |    75 +
>  meta-oe/recipes-extended/tmate/tmate_2.4.0.bb |     1 +
>  .../libvncserver/CVE-2026-32853.patch         |    76 +
>  .../libvncserver/CVE-2026-32854.patch         |    66 +
>  .../libvncserver/CVE-2026-44988.patch         |    71 +
>  .../libvncserver/CVE-2026-50538.patch         |    49 +
>  .../libvncserver/libvncserver_0.9.15.bb       |     4 +
>  .../{libxmp_4.7.3.bb =3D> libxmp_4.7.4.bb}      |     2 +-
>  ...ibmikmod_3.3.14.bb =3D> libmikmod_3.3.15.bb} |     2 +-
>  .../nmap/files/CVE-2026-58058.patch           |    34 +
>  .../nmap/files/CVE-2026-72712.patch           |    46 +
>  meta-oe/recipes-security/nmap/nmap_7.99.bb    |     2 +
>  ...troy-detach-queries-before-callbacks.patch |  2603 +++
>  ...ed-socket-server-state-notifications.patch |   393 +
>  ...qcache-hand-callbacks-their-own-copy.patch |  1054 ++
>  ...connections-torn-down-by-application.patch |  1107 ++
>  ...pt-an-answer-on-the-right-connection.patch |   575 +
>  ...tions-read-channel-config-under-lock.patch |   243 +
>  ...res_inet_pton-reject-a-prefix-length.patch |   364 +
>  ...nt-drop-UDP-answers-from-server-port.patch |   178 +
>  .../recipes-support/c-ares/c-ares_1.34.8.bb   |     8 +
>  .../libmspack/CVE-2026-110602.patch           |    41 +
>  .../cabextract/libmspack_0.11alpha.bb         |     4 +-
>  ...1-winpr-tools-link-only-winpr-public.patch |    76 -
>  ...{freerdp3_3.32.1.bb =3D> freerdp3_3.32.2.bb} |     3 +-
>  .../{libspdm_3.8.2.bb =3D> libspdm_3.8.3.bb}    |     2 +-
>  ...ve-eMudhra-emSign-Root-CA-C1-and-emS.patch |   272 +
>  ...ve-eMudhra-emSign-Root-CA-G3-from-NS.patch |   143 +
>  meta-oe/recipes-support/nss/nss_3.126.bb      |     2 +
>  .../opensc/opensc/CVE-2026-103531.patch       |    54 +
>  .../recipes-support/opensc/opensc_0.27.1.bb   |     1 +
>  .../poppler/poppler/CVE-2026-102620-1.patch   |   145 +
>  .../poppler/poppler/CVE-2026-102620-2.patch   |    34 +
>  .../poppler/poppler/CVE-2026-102621.patch     |    40 +
>  .../poppler/poppler_26.08.0.bb                |     3 +
>  .../{spitools_1.1.0.bb =3D> spitools_1.1.1.bb}  |     2 +-
>  .../udisks/udisks2/CVE-2026-7867-1.patch      |   249 +
>  .../udisks/udisks2/CVE-2026-7867-2.patch      |   208 +
>  .../udisks/udisks2/CVE-2026-7867-3.patch      |    53 +
>  .../udisks/udisks2/CVE-2026-7867-4.patch      |    40 +
>  .../udisks/udisks2/CVE-2026-7867-5.patch      |   348 +
>  .../recipes-support/udisks/udisks2_2.10.2.bb  |     9 +-
>  ...proxy_0.1.7.bb =3D> xdg-dbus-proxy_0.1.9.bb} |     2 +-
>  ...rotli_1.2.0.bb =3D> python3-brotli_1.2.1.bb} |     2 +-
>  ...-cbor2_6.1.4.bb =3D> python3-cbor2_6.1.5.bb} |     2 +-
>  .../0001-Update-gRPC-repo-roots.-43699.patch  |  2617 +++
>  ...e-repo-roots-to-chromium-roots-42094.patch | 14324 ++++++++++++++++
>  .../python/python3-grpcio_1.78.0.bb           |     6 +
>  .../python3-oauthlib/CVE-2026-49265.patch     |    51 +
>  .../python/python3-oauthlib_3.3.1.bb          |     2 +
>  ...yjwt_2.13.0.bb =3D> python3-pyjwt_2.14.0.bb} |     2 +-
>  ...gger-ui_5.33.1.bb =3D> swagger-ui_5.33.3.bb} |     2 +-
>  ...mod_md-Add-OpenSSL-4.0-compatibility.patch |    47 -
>  .../{apache2_2.4.68.bb =3D> apache2_2.4.69.bb}  |     3 +-
>  .../{nginx_1.30.5.bb =3D> nginx_1.30.6.bb}      |     5 +-
>  .../netdata/netdata_2.10.4.bb                 |     2 +
>  99 files changed, 29302 insertions(+), 152 deletions(-)
>  create mode 100644
> meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57160.pat=
ch
>  create mode 100644
> meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57161.pat=
ch
>  create mode 100644
> meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57162.pat=
ch
>  create mode 100644
> meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57163.pat=
ch
>  create mode 100644
> meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57164.pat=
ch
>  create mode 100644
> meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57165.pat=
ch
>  create mode 100644
> meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57166.pat=
ch
>  create mode 100644
> meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-77396.pat=
ch
>  create mode 100644
> meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-84975.pat=
ch
>  rename meta-networking/recipes-support/mctp/{mctp_2.6.bb =3D> mctp_2.6.1=
.bb}
> (100%)
>  rename meta-networking/recipes-support/mctp/{mctpd_2.6.bb =3D>
> mctpd_2.6.1.bb} (100%)
>  create mode 100644
> meta-networking/recipes-support/mtr/mtr/CVE-2026-14461.patch
>  rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.5.bb =3D>
> ntpsec_1.2.6.bb} (98%)
>  create mode 100644
> meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch
>  rename meta-networking/recipes-support/unbound/{unbound_1.26.1.bb =3D>
> unbound_1.26.2.bb} (98%)
>  create mode 100644
> meta-oe/recipes-dbs/psqlodbc/files/CVE-2026-109448.patch
>  create mode 100644
> meta-oe/recipes-devtools/grpc/grpc/0001-security-Update-gRPC-repo-roots.-=
43699.patch
>  rename meta-oe/recipes-devtools/php/{php_8.5.11.bb =3D> php_8.5.12.bb}
> (99%)
>  rename meta-oe/recipes-extended/7zip/{7zip_26.03.bb =3D> 7zip_26.05.bb}
> (98%)
>  rename meta-oe/recipes-extended/brotli/{brotli_1.2.0.bb =3D>
> brotli_1.2.1.bb} (79%)
>  rename meta-oe/recipes-extended/flatpak/{flatpak_1.18.0.bb =3D>
> flatpak_1.18.4.bb} (94%)
>  rename meta-oe/recipes-extended/redis/{redis-8.10.2 =3D>
> redis-8.10.3}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-8.10.2 =3D>
> redis-8.10.3}/0002-lua-update-Makefile-to-use-environment-build-setting.p=
atch
> (100%)
>  rename meta-oe/recipes-extended/redis/{redis-8.10.2 =3D>
> redis-8.10.3}/0003-hack-to-force-use-of-libc-malloc.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-8.10.2 =3D>
> redis-8.10.3}/0004-src-Do-not-reset-FINAL_LIBS.patch (100%)
>  rename meta-oe/recipes-extended/redis/{redis-8.10.2 =3D>
> redis-8.10.3}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.pa=
tch
> (100%)
>  rename meta-oe/recipes-extended/redis/{redis-8.10.2 =3D>
> redis-8.10.3}/0006-src-Makefile-do-not-build-the-test-modules-from-all.pa=
tch
> (100%)
>  rename meta-oe/recipes-extended/redis/{redis-8.10.2 =3D>
> redis-8.10.3}/init-redis-server (100%)
>  rename meta-oe/recipes-extended/redis/{redis-8.10.2 =3D>
> redis-8.10.3}/redis.conf (100%)
>  rename meta-oe/recipes-extended/redis/{redis-8.10.2 =3D>
> redis-8.10.3}/redis.service (100%)
>  rename meta-oe/recipes-extended/redis/{redis_8.10.2.bb =3D> redis_8.10.3=
.bb}
> (98%)
>  create mode 100644
> meta-oe/recipes-extended/tmate/files/CVE-2026-4751.patch
>  create mode 100644
> meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32853.patch
>  create mode 100644
> meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32854.patch
>  create mode 100644
> meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-44988.patch
>  create mode 100644
> meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-50538.patch
>  rename meta-oe/recipes-multimedia/libxmp/{libxmp_4.7.3.bb =3D>
> libxmp_4.7.4.bb} (85%)
>  rename meta-oe/recipes-multimedia/mikmod/{libmikmod_3.3.14.bb =3D>
> libmikmod_3.3.15.bb} (90%)
>  create mode 100644
> meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch
>  create mode 100644
> meta-oe/recipes-security/nmap/files/CVE-2026-72712.patch
>  create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/0001-ares_cancel-ares_destroy-detac=
h-queries-before-callbacks.patch
>  create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/0002-Deliver-deferred-socket-server=
-state-notifications.patch
>  create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/0003-ares_qcache-hand-callbacks-the=
ir-own-copy.patch
>  create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/0004-Handle-connections-torn-down-b=
y-application.patch
>  create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/0005-ares_process-only-accept-an-an=
swer-on-the-right-connection.patch
>  create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/0006-ares_save_options-read-channel=
-config-under-lock.patch
>  create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/0007-ares_inet_pton-reject-a-prefix=
-length.patch
>  create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/0008-ares_conn_read-dont-drop-UDP-a=
nswers-from-server-port.patch
>  create mode 100644
> meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch
>  delete mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/0001-winpr-tools-link-only-winpr=
-public.patch
>  rename meta-oe/recipes-support/freerdp/{freerdp3_3.32.1.bb =3D>
> freerdp3_3.32.2.bb} (98%)
>  rename meta-oe/recipes-support/libspdm/{libspdm_3.8.2.bb =3D>
> libspdm_3.8.3.bb} (98%)
>  create mode 100644
> meta-oe/recipes-support/nss/nss/0008-Bug-2083709-Remove-eMudhra-emSign-Ro=
ot-CA-C1-and-emS.patch
>  create mode 100644
> meta-oe/recipes-support/nss/nss/0009-Bug-2084101-Remove-eMudhra-emSign-Ro=
ot-CA-G3-from-NS.patch
>  create mode 100644
> meta-oe/recipes-support/opensc/opensc/CVE-2026-103531.patch
>  create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2026-102620-1.patch
>  create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2026-102620-2.patch
>  create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2026-102621.patch
>  rename meta-oe/recipes-support/spitools/{spitools_1.1.0.bb =3D>
> spitools_1.1.1.bb} (87%)
>  create mode 100644
> meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-1.patch
>  create mode 100644
> meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-2.patch
>  create mode 100644
> meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-3.patch
>  create mode 100644
> meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-4.patch
>  create mode 100644
> meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-5.patch
>  rename meta-oe/recipes-support/xdg-dbus-proxy/{xdg-dbus-proxy_0.1.7.bb
> =3D> xdg-dbus-proxy_0.1.9.bb} (93%)
>  rename meta-python/recipes-devtools/python/{python3-brotli_1.2.0.bb =3D>
> python3-brotli_1.2.1.bb} (81%)
>  rename meta-python/recipes-devtools/python/{python3-cbor2_6.1.4.bb =3D>
> python3-cbor2_6.1.5.bb} (87%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-grpcio/0001-Update-gRPC-repo-=
roots.-43699.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-grpcio/0001-Update-repo-roots=
-to-chromium-roots-42094.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49265.patch
>  rename meta-python/recipes-devtools/python/{python3-pyjwt_2.13.0.bb =3D>
> python3-pyjwt_2.14.0.bb} (84%)
>  rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.33.1.bb
> =3D> swagger-ui_5.33.3.bb} (94%)
>  delete mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/0011-mod_md-Add-OpenSSL-4.0-=
compatibility.patch
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.68.bb =3D>
> apache2_2.4.69.bb} (98%)
>  rename meta-webserver/recipes-httpd/nginx/{nginx_1.30.5.bb =3D>
> nginx_1.30.6.bb} (63%)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131552):
> https://lists.openembedded.org/g/openembedded-devel/message/131552
> Mute This Topic: https://lists.openembedded.org/mt/121972299/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000073e547065edf93db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged now, thanks=C2=A0Ankur</div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue,=
 Oct 27, 2026 at 9:23=E2=80=AFPM Ankur Tyagi via <a href=3D"http://lists.op=
enembedded.org">lists.openembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"m=
ailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fro=
m: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=3D"_bl=
ank">ankur.tyagi85@gmail.com</a>&gt;<br>
<br>
Please merge these changes in blacksail. Tested locally and on autobuilder.=
<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1904" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1904</a><br>
<br>
The following changes since commit a9d69bc066bf9498397db27902c287dd666fdfd4=
:<br>
<br>
=C2=A0 lvgl-demo-fb: fix SRCREV (2026-10-14 09:26:03 +1300)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> ankurt/blacksail<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Dankurt/blacksail" rel=3D"noreferrer" target=3D"_blank">https://git.o=
penembedded.org/meta-openembedded-contrib/log/?h=3Dankurt/blacksail</a><br>
<br>
for you to fetch changes up to bb956bf8ff7a32f31deaa83e96880d10ab564d14:<br=
>
<br>
=C2=A0 redis: upgrade 8.10.2 -&gt; 8.10.3 (2026-10-28 08:22:29 +1300)<br>
<br>
----------------------------------------------------------------<br>
<br>
Ankur Tyagi (51):<br>
=C2=A0 zeroconf: ignore CVEs<br>
=C2=A0 udisks2: patch CVE-2026-7867<br>
=C2=A0 tmate: patch CVE-2026-4751<br>
=C2=A0 tinyproxy: patch CVE-2026-54388<br>
=C2=A0 flatpak: upgrade 1.18.0 -&gt; 1.18.4<br>
=C2=A0 xdg-dbus-proxy: upgrade 0.1.7 -&gt; 0.1.9<br>
=C2=A0 swagger-ui: upgrade 5.33.1 -&gt; 5.33.2<br>
=C2=A0 freerdp3: upgrade 3.32.1 -&gt; 3.32.2<br>
=C2=A0 spitools: upgrade 1.1.0 -&gt; 1.1.1<br>
=C2=A0 libspdm: upgrade 3.8.2 -&gt; 3.8.3<br>
=C2=A0 libmikmod: upgrade 3.3.14 -&gt; 3.3.15<br>
=C2=A0 libxmp: upgrade 4.7.3 -&gt; 4.7.4<br>
=C2=A0 python3-pyjwt: upgrade 2.13.0 -&gt; 2.14.0<br>
=C2=A0 python3-cbor2: upgrade 6.1.4 -&gt; 6.1.5<br>
=C2=A0 samba: ignore CVE-2026-2340<br>
=C2=A0 rapidjson: mark CVE-2024-38517 fixed<br>
=C2=A0 psqlodbc: patch CVE-2026-109448<br>
=C2=A0 proftpd: mark CVE-2026-53994 fixed<br>
=C2=A0 postfix: ignore CVE-2023-32182<br>
=C2=A0 poppler: patch CVE-2026-102621<br>
=C2=A0 poppler: patch CVE-2026-102620<br>
=C2=A0 opensc: patch CVE-2026-103531<br>
=C2=A0 pjproject: mark CVE-2026-26967 fixed<br>
=C2=A0 pjproject: patch CVE-2026-57160<br>
=C2=A0 pjproject: patch CVE-2026-57161<br>
=C2=A0 pjproject: patch CVE-2026-57162<br>
=C2=A0 pjproject: patch CVE-2026-57163<br>
=C2=A0 pjproject: patch CVE-2026-57164<br>
=C2=A0 pjproject: patch CVE-2026-57165<br>
=C2=A0 pjproject: patch CVE-2026-57166<br>
=C2=A0 pjproject: patch CVE-2026-77396<br>
=C2=A0 pjproject: patch CVE-2026-84975<br>
=C2=A0 nmap: patch CVE-2026-58058<br>
=C2=A0 nmap: patch CVE-2026-72712<br>
=C2=A0 netdata: mark CVE-2026-83602 fixed<br>
=C2=A0 mtr: patch CVE-2026-14461<br>
=C2=A0 ncp: ignore CVE-2025-14577 and CVE-2026-35087<br>
=C2=A0 libvncserver: patch CVE-2026-44988<br>
=C2=A0 libvncserver: patch CVE-2026-32854<br>
=C2=A0 libvncserver: patch CVE-2026-32853<br>
=C2=A0 libvncserver: patch CVE-2026-50538<br>
=C2=A0 swagger-ui: upgrade 5.33.2 -&gt; 5.33.3<br>
=C2=A0 libmspack: patch CVE-2026-110602<br>
=C2=A0 unbound: upgrade 1.26.1 -&gt; 1.26.2<br>
=C2=A0 ntpsec: upgrade 1.2.5 -&gt; 1.2.6<br>
=C2=A0 apache2: upgrade 2.4.68 -&gt; 2.4.69<br>
=C2=A0 7zip: upgrade 26.03 -&gt; 26.04<br>
=C2=A0 7zip: upgrade 26.04 -&gt; 26.05<br>
=C2=A0 python3-brotli: upgrade 1.2.0 -&gt; 1.2.1<br>
=C2=A0 python3-oauthlib: patch CVE-2026-49265<br>
=C2=A0 redis: upgrade 8.10.2 -&gt; 8.10.3<br>
<br>
James Lee (1):<br>
=C2=A0 mctp: upgrade 2.6 -&gt; 2.6.1<br>
<br>
Jason Schonberg (3):<br>
=C2=A0 brotli: upgrade 1.2.0 -&gt; 1.2.1<br>
=C2=A0 php: upgrade 8.5.11 -&gt; 8.5.12<br>
=C2=A0 c-ares: backport security fixes from 1.34.9<br>
<br>
Peter Marko (5):<br>
=C2=A0 nginx: upgrade 1.30.5 -&gt; 1.30.6<br>
=C2=A0 nginx: set CVE_STATUS for CVE-2026-95101 and CVE-2026-97629<br>
=C2=A0 nss: remove compromised eMudhra certificates<br>
=C2=A0 grpc: update gRPC repo roots<br>
=C2=A0 python3-grpcio: update gRPC repo roots<br>
<br>
=C2=A0.../pjproject/pjproject/CVE-2026-57160.patch=C2=A0 |=C2=A0 =C2=A0 42 =
+<br>
=C2=A0.../pjproject/pjproject/CVE-2026-57161.patch=C2=A0 |=C2=A0 =C2=A0 49 =
+<br>
=C2=A0.../pjproject/pjproject/CVE-2026-57162.patch=C2=A0 |=C2=A0 =C2=A0 43 =
+<br>
=C2=A0.../pjproject/pjproject/CVE-2026-57163.patch=C2=A0 |=C2=A0 =C2=A0 52 =
+<br>
=C2=A0.../pjproject/pjproject/CVE-2026-57164.patch=C2=A0 |=C2=A0 =C2=A0 66 =
+<br>
=C2=A0.../pjproject/pjproject/CVE-2026-57165.patch=C2=A0 |=C2=A0 =C2=A0 85 =
+<br>
=C2=A0.../pjproject/pjproject/CVE-2026-57166.patch=C2=A0 |=C2=A0 =C2=A0228 =
+<br>
=C2=A0.../pjproject/pjproject/CVE-2026-77396.patch=C2=A0 |=C2=A0 =C2=A0 74 =
+<br>
=C2=A0.../pjproject/pjproject/CVE-2026-84975.patch=C2=A0 |=C2=A0 =C2=A0 87 =
+<br>
=C2=A0.../pjproject/<a href=3D"http://pjproject_2.17.bb" rel=3D"noreferrer"=
 target=3D"_blank">pjproject_2.17.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 11 +<br>
=C2=A0.../samba/<a href=3D"http://samba_4.23.11.bb" rel=3D"noreferrer" targ=
et=3D"_blank">samba_4.23.11.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A01 +<br>
=C2=A0.../recipes-daemons/postfix/<a href=3D"http://postfix_3.11.7.bb" rel=
=3D"noreferrer" target=3D"_blank">postfix_3.11.7.bb</a> |=C2=A0 =C2=A0 =C2=
=A02 +<br>
=C2=A0.../recipes-daemons/proftpd/<a href=3D"http://proftpd_1.3.9d.bb" rel=
=3D"noreferrer" target=3D"_blank">proftpd_1.3.9d.bb</a> |=C2=A0 =C2=A0 =C2=
=A01 +<br>
=C2=A0.../zeroconf/<a href=3D"http://zeroconf_0.9.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">zeroconf_0.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A06 +<br>
=C2=A0meta-networking/recipes-support/mctp/mctp.inc |=C2=A0 =C2=A0 =C2=A04 =
+-<br>
=C2=A0.../mctp/{<a href=3D"http://mctp_2.6.bb" rel=3D"noreferrer" target=3D=
"_blank">mctp_2.6.bb</a> =3D&gt; <a href=3D"http://mctp_2.6.1.bb" rel=3D"no=
referrer" target=3D"_blank">mctp_2.6.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 =C2=A00<br>
=C2=A0.../mctp/{<a href=3D"http://mctpd_2.6.bb" rel=3D"noreferrer" target=
=3D"_blank">mctpd_2.6.bb</a> =3D&gt; <a href=3D"http://mctpd_2.6.1.bb" rel=
=3D"noreferrer" target=3D"_blank">mctpd_2.6.1.bb</a>}=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 =C2=A00<br>
=C2=A0.../mtr/mtr/CVE-2026-14461.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 32 +<br>
=C2=A0.../recipes-support/mtr/<a href=3D"http://mtr_0.96.bb" rel=3D"norefer=
rer" target=3D"_blank">mtr_0.96.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 =C2=A04 +-<br>
=C2=A0.../recipes-support/ncp/<a href=3D"http://ncp_1.2.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">ncp_1.2.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 =C2=A03 +<br>
=C2=A0.../{<a href=3D"http://ntpsec_1.2.5.bb" rel=3D"noreferrer" target=3D"=
_blank">ntpsec_1.2.5.bb</a> =3D&gt; <a href=3D"http://ntpsec_1.2.6.bb" rel=
=3D"noreferrer" target=3D"_blank">ntpsec_1.2.6.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 =C2=A02 +-<br>
=C2=A0.../tinyproxy/tinyproxy/CVE-2026-54388.patch=C2=A0 |=C2=A0 =C2=A0 32 =
+<br>
=C2=A0.../tinyproxy/<a href=3D"http://tinyproxy_1.11.3.bb" rel=3D"noreferre=
r" target=3D"_blank">tinyproxy_1.11.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A01 +<br>
=C2=A0.../{<a href=3D"http://unbound_1.26.1.bb" rel=3D"noreferrer" target=
=3D"_blank">unbound_1.26.1.bb</a> =3D&gt; <a href=3D"http://unbound_1.26.2.=
bb" rel=3D"noreferrer" target=3D"_blank">unbound_1.26.2.bb</a>}=C2=A0 |=C2=
=A0 =C2=A0 =C2=A02 +-<br>
=C2=A0.../psqlodbc/files/CVE-2026-109448.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0243 +<br>
=C2=A0.../psqlodbc/<a href=3D"http://psqlodbc_18.00.0002.bb" rel=3D"norefer=
rer" target=3D"_blank">psqlodbc_18.00.0002.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A01 +<br>
=C2=A0...curity-Update-gRPC-repo-roots.-43699.patch |=C2=A0 2617 +++<br>
=C2=A0meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1.84.0.bb" rel=
=3D"noreferrer" target=3D"_blank">grpc_1.84.0.bb</a>=C2=A0 |=C2=A0 =C2=A0 =
=C2=A01 +<br>
=C2=A0.../php/{<a href=3D"http://php_8.5.11.bb" rel=3D"noreferrer" target=
=3D"_blank">php_8.5.11.bb</a> =3D&gt; <a href=3D"http://php_8.5.12.bb" rel=
=3D"noreferrer" target=3D"_blank">php_8.5.12.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 =C2=A02 +-<br>
=C2=A0.../rapidjson/<a href=3D"http://rapidjson_git.bb" rel=3D"noreferrer" =
target=3D"_blank">rapidjson_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A02 +<br>
=C2=A0.../7zip/{<a href=3D"http://7zip_26.03.bb" rel=3D"noreferrer" target=
=3D"_blank">7zip_26.03.bb</a> =3D&gt; <a href=3D"http://7zip_26.05.bb" rel=
=3D"noreferrer" target=3D"_blank">7zip_26.05.bb</a>}=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://brotli_1.2.0.bb" rel=3D"noreferrer" target=3D"=
_blank">brotli_1.2.0.bb</a> =3D&gt; <a href=3D"http://brotli_1.2.1.bb" rel=
=3D"noreferrer" target=3D"_blank">brotli_1.2.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 =C2=A04 +-<br>
=C2=A0.../{<a href=3D"http://flatpak_1.18.0.bb" rel=3D"noreferrer" target=
=3D"_blank">flatpak_1.18.0.bb</a> =3D&gt; <a href=3D"http://flatpak_1.18.4.=
bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.18.4.bb</a>}=C2=A0 |=C2=
=A0 =C2=A0 =C2=A04 +-<br>
=C2=A0...-hiredis-use-default-CC-if-it-is-set.patch |=C2=A0 =C2=A0 =C2=A00<=
br>
=C2=A0...ile-to-use-environment-build-setting.patch |=C2=A0 =C2=A0 =C2=A00<=
br>
=C2=A0...003-hack-to-force-use-of-libc-malloc.patch |=C2=A0 =C2=A0 =C2=A00<=
br>
=C2=A0.../0004-src-Do-not-reset-FINAL_LIBS.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 =C2=A00<br>
=C2=A0...RCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |=C2=A0 =C2=A0 =C2=A00<=
br>
=C2=A0...-not-build-the-test-modules-from-all.patch |=C2=A0 =C2=A0 =C2=A00<=
br>
=C2=A0.../init-redis-server=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A00<br>
=C2=A0.../{redis-8.10.2 =3D&gt; redis-8.10.3}/redis.conf |=C2=A0 =C2=A0 =C2=
=A00<br>
=C2=A0.../redis.service=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A00<=
br>
=C2=A0.../{<a href=3D"http://redis_8.10.2.bb" rel=3D"noreferrer" target=3D"=
_blank">redis_8.10.2.bb</a> =3D&gt; <a href=3D"http://redis_8.10.3.bb" rel=
=3D"noreferrer" target=3D"_blank">redis_8.10.3.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 =C2=A02 +-<br>
=C2=A0.../tmate/files/CVE-2026-4751.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 75 +<br>
=C2=A0meta-oe/recipes-extended/tmate/<a href=3D"http://tmate_2.4.0.bb" rel=
=3D"noreferrer" target=3D"_blank">tmate_2.4.0.bb</a> |=C2=A0 =C2=A0 =C2=A01=
 +<br>
=C2=A0.../libvncserver/CVE-2026-32853.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 76 +<br>
=C2=A0.../libvncserver/CVE-2026-32854.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 66 +<br>
=C2=A0.../libvncserver/CVE-2026-44988.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 71 +<br>
=C2=A0.../libvncserver/CVE-2026-50538.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 49 +<br>
=C2=A0.../libvncserver/<a href=3D"http://libvncserver_0.9.15.bb" rel=3D"nor=
eferrer" target=3D"_blank">libvncserver_0.9.15.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 =C2=A04 +<br>
=C2=A0.../{<a href=3D"http://libxmp_4.7.3.bb" rel=3D"noreferrer" target=3D"=
_blank">libxmp_4.7.3.bb</a> =3D&gt; <a href=3D"http://libxmp_4.7.4.bb" rel=
=3D"noreferrer" target=3D"_blank">libxmp_4.7.4.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://ibmikmod_3.3.14.bb" rel=3D"noreferrer" target=3D=
"_blank">ibmikmod_3.3.14.bb</a> =3D&gt; <a href=3D"http://libmikmod_3.3.15.=
bb" rel=3D"noreferrer" target=3D"_blank">libmikmod_3.3.15.bb</a>} |=C2=A0 =
=C2=A0 =C2=A02 +-<br>
=C2=A0.../nmap/files/CVE-2026-58058.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 34 +<br>
=C2=A0.../nmap/files/CVE-2026-72712.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 46 +<br>
=C2=A0meta-oe/recipes-security/nmap/<a href=3D"http://nmap_7.99.bb" rel=3D"=
noreferrer" target=3D"_blank">nmap_7.99.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =
=C2=A02 +<br>
=C2=A0...troy-detach-queries-before-callbacks.patch |=C2=A0 2603 +++<br>
=C2=A0...ed-socket-server-state-notifications.patch |=C2=A0 =C2=A0393 +<br>
=C2=A0...qcache-hand-callbacks-their-own-copy.patch |=C2=A0 1054 ++<br>
=C2=A0...connections-torn-down-by-application.patch |=C2=A0 1107 ++<br>
=C2=A0...pt-an-answer-on-the-right-connection.patch |=C2=A0 =C2=A0575 +<br>
=C2=A0...tions-read-channel-config-under-lock.patch |=C2=A0 =C2=A0243 +<br>
=C2=A0...res_inet_pton-reject-a-prefix-length.patch |=C2=A0 =C2=A0364 +<br>
=C2=A0...nt-drop-UDP-answers-from-server-port.patch |=C2=A0 =C2=A0178 +<br>
=C2=A0.../recipes-support/c-ares/<a href=3D"http://c-ares_1.34.8.bb" rel=3D=
"noreferrer" target=3D"_blank">c-ares_1.34.8.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 =C2=A08 +<br>
=C2=A0.../libmspack/CVE-2026-110602.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 41 +<br>
=C2=A0.../cabextract/<a href=3D"http://libmspack_0.11alpha.bb" rel=3D"noref=
errer" target=3D"_blank">libmspack_0.11alpha.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A04 +-<br>
=C2=A0...1-winpr-tools-link-only-winpr-public.patch |=C2=A0 =C2=A0 76 -<br>
=C2=A0...{<a href=3D"http://freerdp3_3.32.1.bb" rel=3D"noreferrer" target=
=3D"_blank">freerdp3_3.32.1.bb</a> =3D&gt; <a href=3D"http://freerdp3_3.32.=
2.bb" rel=3D"noreferrer" target=3D"_blank">freerdp3_3.32.2.bb</a>} |=C2=A0 =
=C2=A0 =C2=A03 +-<br>
=C2=A0.../{<a href=3D"http://libspdm_3.8.2.bb" rel=3D"noreferrer" target=3D=
"_blank">libspdm_3.8.2.bb</a> =3D&gt; <a href=3D"http://libspdm_3.8.3.bb" r=
el=3D"noreferrer" target=3D"_blank">libspdm_3.8.3.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 =C2=A02 +-<br>
=C2=A0...ve-eMudhra-emSign-Root-CA-C1-and-emS.patch |=C2=A0 =C2=A0272 +<br>
=C2=A0...ve-eMudhra-emSign-Root-CA-G3-from-NS.patch |=C2=A0 =C2=A0143 +<br>
=C2=A0meta-oe/recipes-support/nss/<a href=3D"http://nss_3.126.bb" rel=3D"no=
referrer" target=3D"_blank">nss_3.126.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 =C2=A02 +<br>
=C2=A0.../opensc/opensc/CVE-2026-103531.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 54 +<br>
=C2=A0.../recipes-support/opensc/<a href=3D"http://opensc_0.27.1.bb" rel=3D=
"noreferrer" target=3D"_blank">opensc_0.27.1.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 =C2=A01 +<br>
=C2=A0.../poppler/poppler/CVE-2026-102620-1.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A0145 +<br>
=C2=A0.../poppler/poppler/CVE-2026-102620-2.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 34 +<br>
=C2=A0.../poppler/poppler/CVE-2026-102621.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0 40 +<br>
=C2=A0.../poppler/<a href=3D"http://poppler_26.08.0.bb" rel=3D"noreferrer" =
target=3D"_blank">poppler_26.08.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A03 +<br>
=C2=A0.../{<a href=3D"http://spitools_1.1.0.bb" rel=3D"noreferrer" target=
=3D"_blank">spitools_1.1.0.bb</a> =3D&gt; <a href=3D"http://spitools_1.1.1.=
bb" rel=3D"noreferrer" target=3D"_blank">spitools_1.1.1.bb</a>}=C2=A0 |=C2=
=A0 =C2=A0 =C2=A02 +-<br>
=C2=A0.../udisks/udisks2/CVE-2026-7867-1.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0249 +<br>
=C2=A0.../udisks/udisks2/CVE-2026-7867-2.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0208 +<br>
=C2=A0.../udisks/udisks2/CVE-2026-7867-3.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 53 +<br>
=C2=A0.../udisks/udisks2/CVE-2026-7867-4.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 40 +<br>
=C2=A0.../udisks/udisks2/CVE-2026-7867-5.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0348 +<br>
=C2=A0.../recipes-support/udisks/<a href=3D"http://udisks2_2.10.2.bb" rel=
=3D"noreferrer" target=3D"_blank">udisks2_2.10.2.bb</a>=C2=A0 |=C2=A0 =C2=
=A0 =C2=A09 +-<br>
=C2=A0...<a href=3D"http://proxy_0.1.7.bb" rel=3D"noreferrer" target=3D"_bl=
ank">proxy_0.1.7.bb</a> =3D&gt; <a href=3D"http://xdg-dbus-proxy_0.1.9.bb" =
rel=3D"noreferrer" target=3D"_blank">xdg-dbus-proxy_0.1.9.bb</a>} |=C2=A0 =
=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://rotli_1.2.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">rotli_1.2.0.bb</a> =3D&gt; <a href=3D"http://python3-brotli_1.2.1.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.2.1.bb</a>} |=C2=A0 =
=C2=A0 =C2=A02 +-<br>
=C2=A0...-<a href=3D"http://cbor2_6.1.4.bb" rel=3D"noreferrer" target=3D"_b=
lank">cbor2_6.1.4.bb</a> =3D&gt; <a href=3D"http://python3-cbor2_6.1.5.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-cbor2_6.1.5.bb</a>} |=C2=A0 =
=C2=A0 =C2=A02 +-<br>
=C2=A0.../0001-Update-gRPC-repo-roots.-43699.patch=C2=A0 |=C2=A0 2617 +++<b=
r>
=C2=A0...e-repo-roots-to-chromium-roots-42094.patch | 14324 +++++++++++++++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-grpcio_1.78.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-grpcio_1.78.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A06 +<br>
=C2=A0.../python3-oauthlib/CVE-2026-49265.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0 51 +<br>
=C2=A0.../python/<a href=3D"http://python3-oauthlib_3.3.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-oauthlib_3.3.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A02 +<br>
=C2=A0...<a href=3D"http://yjwt_2.13.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">yjwt_2.13.0.bb</a> =3D&gt; <a href=3D"http://python3-pyjwt_2.14.0.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-pyjwt_2.14.0.bb</a>} |=C2=A0 =
=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://gger-ui_5.33.1.bb" rel=3D"noreferrer" target=3D"=
_blank">gger-ui_5.33.1.bb</a> =3D&gt; <a href=3D"http://swagger-ui_5.33.3.b=
b" rel=3D"noreferrer" target=3D"_blank">swagger-ui_5.33.3.bb</a>} |=C2=A0 =
=C2=A0 =C2=A02 +-<br>
=C2=A0...mod_md-Add-OpenSSL-4.0-compatibility.patch |=C2=A0 =C2=A0 47 -<br>
=C2=A0.../{<a href=3D"http://apache2_2.4.68.bb" rel=3D"noreferrer" target=
=3D"_blank">apache2_2.4.68.bb</a> =3D&gt; <a href=3D"http://apache2_2.4.69.=
bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.69.bb</a>}=C2=A0 |=C2=
=A0 =C2=A0 =C2=A03 +-<br>
=C2=A0.../{<a href=3D"http://nginx_1.30.5.bb" rel=3D"noreferrer" target=3D"=
_blank">nginx_1.30.5.bb</a> =3D&gt; <a href=3D"http://nginx_1.30.6.bb" rel=
=3D"noreferrer" target=3D"_blank">nginx_1.30.6.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 =C2=A05 +-<br>
=C2=A0.../netdata/<a href=3D"http://netdata_2.10.4.bb" rel=3D"noreferrer" t=
arget=3D"_blank">netdata_2.10.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A02 +<br>
=C2=A099 files changed, 29302 insertions(+), 152 deletions(-)<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjpro=
ject/CVE-2026-57160.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjpro=
ject/CVE-2026-57161.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjpro=
ject/CVE-2026-57162.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjpro=
ject/CVE-2026-57163.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjpro=
ject/CVE-2026-57164.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjpro=
ject/CVE-2026-57165.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjpro=
ject/CVE-2026-57166.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjpro=
ject/CVE-2026-77396.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjpro=
ject/CVE-2026-84975.patch<br>
=C2=A0rename meta-networking/recipes-support/mctp/{<a href=3D"http://mctp_2=
.6.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.6.bb</a> =3D&gt; <a href=
=3D"http://mctp_2.6.1.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.6.1.b=
b</a>} (100%)<br>
=C2=A0rename meta-networking/recipes-support/mctp/{<a href=3D"http://mctpd_=
2.6.bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.6.bb</a> =3D&gt; <a hr=
ef=3D"http://mctpd_2.6.1.bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.6=
.1.bb</a>} (100%)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/mtr/mtr/CVE-2026-1=
4461.patch<br>
=C2=A0rename meta-networking/recipes-support/ntpsec/{<a href=3D"http://ntps=
ec_1.2.5.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.5.bb</a> =3D&g=
t; <a href=3D"http://ntpsec_1.2.6.bb" rel=3D"noreferrer" target=3D"_blank">=
ntpsec_1.2.6.bb</a>} (98%)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/tinyproxy/tinyprox=
y/CVE-2026-54388.patch<br>
=C2=A0rename meta-networking/recipes-support/unbound/{<a href=3D"http://unb=
ound_1.26.1.bb" rel=3D"noreferrer" target=3D"_blank">unbound_1.26.1.bb</a> =
=3D&gt; <a href=3D"http://unbound_1.26.2.bb" rel=3D"noreferrer" target=3D"_=
blank">unbound_1.26.2.bb</a>} (98%)<br>
=C2=A0create mode 100644 meta-oe/recipes-dbs/psqlodbc/files/CVE-2026-109448=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-security-U=
pdate-gRPC-repo-roots.-43699.patch<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.5.11.bb"=
 rel=3D"noreferrer" target=3D"_blank">php_8.5.11.bb</a> =3D&gt; <a href=3D"=
http://php_8.5.12.bb" rel=3D"noreferrer" target=3D"_blank">php_8.5.12.bb</a=
>} (99%)<br>
=C2=A0rename meta-oe/recipes-extended/7zip/{<a href=3D"http://7zip_26.03.bb=
" rel=3D"noreferrer" target=3D"_blank">7zip_26.03.bb</a> =3D&gt; <a href=3D=
"http://7zip_26.05.bb" rel=3D"noreferrer" target=3D"_blank">7zip_26.05.bb</=
a>} (98%)<br>
=C2=A0rename meta-oe/recipes-extended/brotli/{<a href=3D"http://brotli_1.2.=
0.bb" rel=3D"noreferrer" target=3D"_blank">brotli_1.2.0.bb</a> =3D&gt; <a h=
ref=3D"http://brotli_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">brotli_=
1.2.1.bb</a>} (79%)<br>
=C2=A0rename meta-oe/recipes-extended/flatpak/{<a href=3D"http://flatpak_1.=
18.0.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.18.0.bb</a> =3D&gt;=
 <a href=3D"http://flatpak_1.18.4.bb" rel=3D"noreferrer" target=3D"_blank">=
flatpak_1.18.4.bb</a>} (94%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-8.10.2 =3D&gt; redis-8.1=
0.3}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-8.10.2 =3D&gt; redis-8.1=
0.3}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (100%)=
<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-8.10.2 =3D&gt; redis-8.1=
0.3}/0003-hack-to-force-use-of-libc-malloc.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-8.10.2 =3D&gt; redis-8.1=
0.3}/0004-src-Do-not-reset-FINAL_LIBS.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-8.10.2 =3D&gt; redis-8.1=
0.3}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (100%)<=
br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-8.10.2 =3D&gt; redis-8.1=
0.3}/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch (100%)<=
br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-8.10.2 =3D&gt; redis-8.1=
0.3}/init-redis-server (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-8.10.2 =3D&gt; redis-8.1=
0.3}/redis.conf (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{redis-8.10.2 =3D&gt; redis-8.1=
0.3}/redis.service (100%)<br>
=C2=A0rename meta-oe/recipes-extended/redis/{<a href=3D"http://redis_8.10.2=
.bb" rel=3D"noreferrer" target=3D"_blank">redis_8.10.2.bb</a> =3D&gt; <a hr=
ef=3D"http://redis_8.10.3.bb" rel=3D"noreferrer" target=3D"_blank">redis_8.=
10.3.bb</a>} (98%)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/tmate/files/CVE-2026-4751=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver=
/CVE-2026-32853.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver=
/CVE-2026-32854.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver=
/CVE-2026-44988.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver=
/CVE-2026-50538.patch<br>
=C2=A0rename meta-oe/recipes-multimedia/libxmp/{<a href=3D"http://libxmp_4.=
7.3.bb" rel=3D"noreferrer" target=3D"_blank">libxmp_4.7.3.bb</a> =3D&gt; <a=
 href=3D"http://libxmp_4.7.4.bb" rel=3D"noreferrer" target=3D"_blank">libxm=
p_4.7.4.bb</a>} (85%)<br>
=C2=A0rename meta-oe/recipes-multimedia/mikmod/{<a href=3D"http://libmikmod=
_3.3.14.bb" rel=3D"noreferrer" target=3D"_blank">libmikmod_3.3.14.bb</a> =
=3D&gt; <a href=3D"http://libmikmod_3.3.15.bb" rel=3D"noreferrer" target=3D=
"_blank">libmikmod_3.3.15.bb</a>} (90%)<br>
=C2=A0create mode 100644 meta-oe/recipes-security/nmap/files/CVE-2026-58058=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-security/nmap/files/CVE-2026-72712=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-ares_ca=
ncel-ares_destroy-detach-queries-before-callbacks.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0002-Deliver=
-deferred-socket-server-state-notifications.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0003-ares_qc=
ache-hand-callbacks-their-own-copy.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0004-Handle-=
connections-torn-down-by-application.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0005-ares_pr=
ocess-only-accept-an-answer-on-the-right-connection.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0006-ares_sa=
ve_options-read-channel-config-under-lock.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0007-ares_in=
et_pton-reject-a-prefix-length.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0008-ares_co=
nn_read-dont-drop-UDP-answers-from-server-port.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/cabextract/libmspack/CVE-2=
026-110602.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/freerdp/freerdp3/0001-winp=
r-tools-link-only-winpr-public.patch<br>
=C2=A0rename meta-oe/recipes-support/freerdp/{<a href=3D"http://freerdp3_3.=
32.1.bb" rel=3D"noreferrer" target=3D"_blank">freerdp3_3.32.1.bb</a> =3D&gt=
; <a href=3D"http://freerdp3_3.32.2.bb" rel=3D"noreferrer" target=3D"_blank=
">freerdp3_3.32.2.bb</a>} (98%)<br>
=C2=A0rename meta-oe/recipes-support/libspdm/{<a href=3D"http://libspdm_3.8=
.2.bb" rel=3D"noreferrer" target=3D"_blank">libspdm_3.8.2.bb</a> =3D&gt; <a=
 href=3D"http://libspdm_3.8.3.bb" rel=3D"noreferrer" target=3D"_blank">libs=
pdm_3.8.3.bb</a>} (98%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/nss/nss/0008-Bug-2083709-R=
emove-eMudhra-emSign-Root-CA-C1-and-emS.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/nss/nss/0009-Bug-2084101-R=
emove-eMudhra-emSign-Root-CA-G3-from-NS.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2026-103=
531.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2026-1=
02620-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2026-1=
02620-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2026-1=
02621.patch<br>
=C2=A0rename meta-oe/recipes-support/spitools/{<a href=3D"http://spitools_1=
.1.0.bb" rel=3D"noreferrer" target=3D"_blank">spitools_1.1.0.bb</a> =3D&gt;=
 <a href=3D"http://spitools_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">=
spitools_1.1.1.bb</a>} (87%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-78=
67-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-78=
67-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-78=
67-3.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-78=
67-4.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-78=
67-5.patch<br>
=C2=A0rename meta-oe/recipes-support/xdg-dbus-proxy/{<a href=3D"http://xdg-=
dbus-proxy_0.1.7.bb" rel=3D"noreferrer" target=3D"_blank">xdg-dbus-proxy_0.=
1.7.bb</a> =3D&gt; <a href=3D"http://xdg-dbus-proxy_0.1.9.bb" rel=3D"norefe=
rrer" target=3D"_blank">xdg-dbus-proxy_0.1.9.bb</a>} (93%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-brotli_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.2.0=
.bb</a> =3D&gt; <a href=3D"http://python3-brotli_1.2.1.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-brotli_1.2.1.bb</a>} (81%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-cbor2_6.1.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-cbor2_6.1.4.b=
b</a> =3D&gt; <a href=3D"http://python3-cbor2_6.1.5.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-cbor2_6.1.5.bb</a>} (87%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-grpcio=
/0001-Update-gRPC-repo-roots.-43699.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-grpcio=
/0001-Update-repo-roots-to-chromium-roots-42094.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-oauthl=
ib/CVE-2026-49265.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-pyjwt_2.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyjwt_2.13.0=
.bb</a> =3D&gt; <a href=3D"http://python3-pyjwt_2.14.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-pyjwt_2.14.0.bb</a>} (84%)<br>
=C2=A0rename meta-webserver/recipes-devtools/swagger-ui/{<a href=3D"http://=
swagger-ui_5.33.1.bb" rel=3D"noreferrer" target=3D"_blank">swagger-ui_5.33.=
1.bb</a> =3D&gt; <a href=3D"http://swagger-ui_5.33.3.bb" rel=3D"noreferrer"=
 target=3D"_blank">swagger-ui_5.33.3.bb</a>} (94%)<br>
=C2=A0delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0011-=
mod_md-Add-OpenSSL-4.0-compatibility.patch<br>
=C2=A0rename meta-webserver/recipes-httpd/apache2/{<a href=3D"http://apache=
2_2.4.68.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.68.bb</a> =3D=
&gt; <a href=3D"http://apache2_2.4.69.bb" rel=3D"noreferrer" target=3D"_bla=
nk">apache2_2.4.69.bb</a>} (98%)<br>
=C2=A0rename meta-webserver/recipes-httpd/nginx/{<a href=3D"http://nginx_1.=
30.5.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.30.5.bb</a> =3D&gt; <=
a href=3D"http://nginx_1.30.6.bb" rel=3D"noreferrer" target=3D"_blank">ngin=
x_1.30.6.bb</a>} (63%)<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131552): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131552" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131552</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121972299/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121972299/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000073e547065edf93db--
