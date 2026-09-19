Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB58CC982D8
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 22:25:03 +0000 (UTC)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20579.1789856697960348150
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Sep 2026 15:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YZ6zWKDa;
 spf=pass (domain: gmail.com, ip: 74.125.224.141, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aac92dbso1646331d50.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 15:24:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789856697; cv=none;
        d=google.com; s=arc-20260327;
        b=MHH48O5DB1Tlxv3nwSuks4Es4sve8Tdd/70YmnJK8B9A4mdi5ppV9f+zQ4ec7XrzjN
         z6TKB1QA7L2Rx/0vooB9PEQwyfydcg46l+91uQ8oU+hPwYP2fRy3zvBEcMxu3KW8NiQU
         /AyRNbrhnirP4hkWAlFK/H8WSm8QD0ROGc1O8k7allLU8NnMUOiM59YUWYHtH765NCBj
         EOQ/cnsAiRkMPAaQKJ8aAB1qedBy0OcK19G0UBHRyIHtp87lbdsTChghewLlarSZ6vHy
         D+3CjPkm31Uh9oZpKmOMqjswyACqIEtFY3oJ3UakI7cFmKVI7xO91cMjkgMEWHbyl3ic
         KjyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J+dneswn1DCkWqFPiPKqDLhXRanzc7Bu/SbVih3DSog=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=oQKvfemwsJztOV4UDoG1s2RYoEjcYPalKLpbG1dP3jcsed6nsWUmEe8BePZrCvdzN+
         0uCY4aHeFFPQkUrPEHxON+iF5wka/r3M/spux2TlFDvpY16QDad6Xz1/kfYRERT6GFoE
         1Pgd0JnvQk7Y0aV7an4nRAhL1k3VEfWmClODavphu9P2aTQtX91TdAd9ta8a3lcK05rT
         1T+bLHw1WS7BHmC++BMMC7PBgyWx1Oe4NS7FbP6sqAvzARZpJFenKZ9v8we8Ga8aIbFN
         GyEhyZw7ed4Fm9EZYaijoxkruwCNmRU4vd3yDlkxkJXx1MNKNcff6ifintqiRyXqtvCu
         AW2w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856697; x=1790461497; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+dneswn1DCkWqFPiPKqDLhXRanzc7Bu/SbVih3DSog=;
        b=YZ6zWKDakdYlsuNRsIDquIhZaUaPb00xjq7HRRcfpFPbsxrQv2wyn9P0YSV8T5q97+
         6RuEAcTW93HZ2sUbKVBP0mvQ7OqN2VUVoK3N0sXeSVRPpyayzGJNgxuCYIhjKe2qcAl2
         UoAke4CfzhiIxe0QB5Bjcx293RRwygHS+KXVX+1wmgfZsiLfD2e7Tgajepub+uI/aEWS
         D3xjhqxKTqXocIuWLJ7HrKY3eHL51WQJ7F1F1YSJWY8Lb4GwcrK/aVgiTrpjqnCG//M5
         BpzWNUadXykG7dJiq/Zq1Ck/4Kr6+hzAdra4M5yIcs8B5IyKIdP+G/W5K9LNzvL2qq0i
         Psvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856697; x=1790461497;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J+dneswn1DCkWqFPiPKqDLhXRanzc7Bu/SbVih3DSog=;
        b=pPgqVmV8RKqCYLonBNHzboLwuyugtPnfrYQtpazs1kpLrpNH5NItsJX5a//tkJsA1Y
         moh1Q9LZshErB+PCZjP6Acgtx8PIzLW5zEam7C/rzcqZ/YJiE8xS7kAfmhQ+Kht8xnLy
         4roxQulaZFcEjQC9RV3HIdqAML0pr//Jf/KcQG19dTCIz35Rc8ZIUMnLIOKrpIKfm+ct
         MIX9v0ee4XbbA/cO09f/9my+6bsTWSv5ULnAF4N7KFRUZ+XVNzYNNbQBzhloaMcBkPXF
         dpWUEJlM4b0apPjYwpcuXOQfTc8aexucq/2c6ztzYn3/IVjfQ6m+VW6UW7Ri7uQPuaaT
         ekEg==
X-Gm-Message-State: AFuF++mnOdAvMbeW+/D/xRMPXg+lus6rZ0bWCpbIMu7uud1d0Yyk7Jw9
	ee1u2oVC17VP9bxid9cvlLd5OX0bzfSgweBgxPIs4uA++lwTnCP383y4a9z5mflmHQLdQgBNuwG
	mY7sAKbIviZgEBjSeCGmWMavWzhXk+puIiQ==
X-Gm-Gg: AYBFou0kq3U97sE4hn0OyGGGn8zHjRY5XZE7W2g+nMSqtRNgVMF67TIm+FrffEHGfo7
	qs3jmcnRQ/4D1j3GZVWuAJ8lCL+ub98v/mnnJke4TFMa+mD3Czx1E+FLXyTC/EnJWDdcnQpCJWS
	piwYye0A7Kls+GcX0M48stLywxeoaAOR1TKS+kjydlOXCyhLUWXfC8H9X4xXTLvDh893a059emS
	hj3mMF6tYwC9buDNbwXKBPUZU9wkoB/EYLyHX/TmkAOQS+ZWM7bw80kXlHMdPXecWliF4ZGJyt8
	FWUKDxqrwRDXLAsr2/l7wEI6XScRZ1lJbUZluwhwg93cKXHOgW4LNfLD52fIVPiqDkFe32vE3hA
	Jw5qdRDLqr3tLkD2xz5IdFgWpE9OACEaO2aiU2++tbNKl3/K4b/DIs8L7Q044+J2u3PwcAN6Qvz
	yepKuWOHHxziCHOiYi+w73jG3OQr5a/HmZc50BeTIuixb8XZlcXnUMXpuE3xnOMnwtBo0gAdOOo
	9ynMW1bdfaC/W47319PFlFdhQP26+taVPZZ
X-Received: by 2002:a05:690e:12cb:b0:670:f87c:211a with SMTP id
 956f58d0204a3-6717fc61914mr2372278d50.20.1789856696695; Sat, 19 Sep 2026
 15:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1789439085.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1789439085.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Sep 2026 15:24:30 -0700
X-Gm-Features: AcwNN1VsSMtHvWrsjFif_YW2574H5Akk9kIigMmHh3AgOSGsefVsMR_9WbTw5vQ
Message-ID: <CAMKF1so=2Q56skgX=5AXFOKXyPyY0tUATZj-SWmZar2N-WyN0g@mail.gmail.com>
Subject: Re: [oe] [PATCH 000/142] Wrynose pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009b0192065bdd7c47"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 22:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130125

--0000000000009b0192065bdd7c47
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LGTM, merged now

Thanks

On Mon, Sep 14, 2026 at 11:09=E2=80=AFPM Anuj Mittal via lists.openembedded=
.org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in wrynose. Tested on autobuilder and locally.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1803
>
> The following changes since commit
> 14282a02be9c74a1276a7cda7d6c89e054699a11:
>
>   libhtml-tree-perl, libmodule-build-tiny-perl: Drop obsolete TMPDIR
> scrubbing (2026-08-26 07:13:01 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/wry=
nose
>
> for you to fetch changes up to 2d08f417301392ef61a7527448207db2eba09845:
>
>   unbound: patch CVE-2026-56444 (2026-09-15 07:52:54 +0530)
>
> ----------------------------------------------------------------
>
> Abhishek Bachiphale (3):
>   thrift: fix CVE-2026-58662
>   thrift: fix CVE-2026-48586
>   thrift: fix CVE-2026-48145
>
> Adarsh Jagadish Kamini (4):
>   thrift: fix CVE-2026-41608
>   thrift: fix CVE-2026-45112
>   thrift: fix CVE-2026-55969
>   thrift: fix CVE-2026-55970
>
> Ankur Tyagi (127):
>   python3-django: upgrade 5.2.16 -> 5.2.17
>   asyncmqtt: upgrade 10.3.0 -> 10.3.1
>   proftpd: upgrade 1.3.9c -> 1.3.9d
>   capnproto: ignore CVE-2026-59704
>   bubblewrap: mark CVE-2026-41163 patched
>   bcc: mark CVE-2024-2314 patched
>   cockpit: mark CVE-2024-2947 patched
>   dool: patch CVE-2026-56651
>   dool: patch CVE-2026-56652
>   dovecot: ignore already fixed CVEs
>   editorconfig-core-c: ignore CVE-2024-53849
>   editorconfig-core-c: patch CVE-2026-40489
>   civetweb: ignore CVE-2026-5789
>   eject: ignore CVE-2026-28065
>   firewalld: patch CVE-2026-4948
>   freeipmi: patch CVE-2026-50031
>   haveged: ignore CVE-2026-41054
>   gpm: ignore CVE-2025-4558
>   gpsd: patch CVE-2026-58459
>   gerbera: ignore CVE-2025-23386
>   hostapd: patch CVE-2026-58374
>   hdf5: patch CVE-2026-17572
>   hdf5: patch CVE-2026-17573
>   hdf5: patch CVE-2026-17574
>   hdf5: patch CVE-2026-19025
>   iftop: ignore CVE-2026-3824, CVE-2026-3825 and CVE-2026-3826
>   iniparser: mark CVE-2025-0633 pached
>   jq: ignore CVE-2025-49014
>   lcms: patch CVE-2026-42798
>   libde265: mark CVE-2026-45382 and CVE-2026-45383 patched
>   libde265: patch CVE-2026-49295
>   libde265: patch CVE-2026-49337
>   libde265: patch CVE-2026-49346
>   libfido2, libfido2-initial: ignore CVE-2026-40947
>   libheif: patch CVE-2026-32738
>   libheif: patch CVE-2026-32739
>   libheif: patch CVE-2026-32740
>   libheif: patch CVE-2026-32741
>   libheif: patch CVE-2026-41071
>   libheif: patch CVE-2026-62289
>   libheif: patch CVE-2026-62377
>   libiec61850: mark CVE-2024-45969 patched
>   libiec61850: patch CVE-2026-18582
>   libiec61850: patch CVE-2026-18583
>   libiec61850: patch CVE-2026-19108
>   libiec61850: patch CVE-2026-19206
>   libkcapi: patch CVE-2026-71226
>   libkcapi: patch CVE-2026-71227
>   libkcapi: patch CVE-2026-71225
>   libnfs: patch CVE-2026-53689
>   libnfs: patch CVE-2026-57918
>   libssh: ignore CVE-2025-14821
>   libssh: mark CVEs patched
>   miniupnpd: patch CVE-2026-5720
>   python3-zeroconf: patch CVE-2026-47180
>   python3-zeroconf: patch CVE-2026-47183
>   python3-zeroconf: patch CVE-2026-47184
>   valkey: mark CVE-2026-56684 and CVE-2026-63639 patched
>   libyang: patch CVE-2026-41401
>   tinyproxy: patch CVE-2026-31842
>   tinyproxy: patch CVE-2026-54387
>   tinyproxy: patch CVE-2026-55202
>   nginx: mark CVE-2026-1642 patched
>   open62541: patch CVE-2026-11946
>   tesseract: patch CVE-2026-73066
>   tesseract: patch CVE-2026-73067
>   wolfssl: mark CVEs patched
>   wolfssl: patch CVE-2026-10098
>   wolfssl: patch CVE-2026-10512
>   wolfssl: ignore CVE-2026-12340
>   wolfssl: patch CVE-2026-55958
>   wolfssl: patch CVE-2026-6091
>   wolfssl: patch CVE-2026-6092
>   wolfssl: patch CVE-2026-6094
>   wolfssl: patch CVE-2026-6291
>   wolfssl: patch CVE-2026-6325
>   wolfssl: patch CVE-2026-6412
>   wolfssl: patch CVE-2026-6450
>   wolfssl: patch CVE-2026-6731
>   wolfssl: patch CVE-2026-7531
>   freerdp3: patch CVE-2026-40254
>   freerdp3: patch CVE-2026-55191
>   freerdp3: patch CVE-2026-55192
>   freerdp3: patch CVE-2026-55193
>   freerdp3: patch CVE-2026-55194
>   freerdp3: patch CVE-2026-55564
>   freerdp3: patch CVE-2026-55648
>   freerdp3: patch CVE-2026-63633
>   freerdp3: patch CVE-2026-63652
>   freerdp3: patch CVE-2026-64620
>   freerdp3: patch CVE-2026-64621
>   freerdp3: patch CVE-2026-66401
>   freerdp3: patch CVE-2026-67288
>   python3-gunicorn: mark CVE-2024-1135 patched
>   python3-h11: mark CVE-2025-43859 patched
>   zabbix: ignore multiple CVEs
>   unbound: patch CVE-2026-33278
>   unbound: patch CVE-2026-42944
>   unbound: patch CVE-2026-42959
>   unbound: patch CVE-2026-32792
>   unbound: patch CVE-2026-40622
>   unbound: patch CVE-2026-41292
>   unbound: patch CVE-2026-42534
>   unbound: patch CVE-2026-42923
>   unbound: patch CVE-2026-42960
>   unbound: patch CVE-2026-44390
>   unbound: patch CVE-2026-44608
>   unbound: patch CVE-2026-46582
>   unbound: patch CVE-2026-32665
>   unbound: patch CVE-2026-42955
>   unbound: patch CVE-2026-44621
>   unbound: patch CVE-2026-44687
>   unbound: patch CVE-2026-50045
>   unbound: patch CVE-2026-50046
>   unbound: patch CVE-2026-50243
>   unbound: patch CVE-2026-50248
>   unbound: patch CVE-2026-50251
>   unbound: patch CVE-2026-50252
>   unbound: patch CVE-2026-52863
>   unbound: patch CVE-2026-54478
>   unbound: patch CVE-2026-55708
>   unbound: patch CVE-2026-55717
>   unbound: patch CVE-2026-55973
>   unbound: patch CVE-2026-55990
>   unbound: patch CVE-2026-55991
>   unbound: patch CVE-2026-56416
>   unbound: patch CVE-2026-56444
>
> Deepak Rathore (1):
>   rsyslog: Fix CVE-2026-19654
>
> Devansh Patel (1):
>   python3-cbor2: use exact CVE_PRODUCT mapping
>
> Himanshu Jadon (3):
>   suitesparse: fix CMake 4 configure failure
>   suitesparse: avoid install rpath buildpaths QA
>   samba, libldb: add package conflicts
>
> Jason Schonberg (1):
>   php: upgrade 8.5.9 -> 8.5.10
>
> Joel Winarske (1):
>   capnproto: build position independent code
>
> Omkar Patil (1):
>   postgresql: upgrade 17.10 -> 17.11
>
>  .../gerbera/gerbera_3.0.0.bb                  |    2 +
>  .../libde265/libde265/CVE-2026-49295.patch    |   41 +
>  .../libde265/libde265/CVE-2026-49337.patch    |   53 +
>  .../libde265/libde265/CVE-2026-49346.patch    |  102 +
>  .../libde265/libde265_1.0.19.bb               |    9 +-
>  .../libheif/libheif/CVE-2026-32738.patch      |   32 +
>  .../libheif/libheif/CVE-2026-32739.patch      |   54 +
>  .../libheif/libheif/CVE-2026-32740.patch      |   40 +
>  .../libheif/libheif/CVE-2026-32741.patch      |   29 +
>  .../libheif/libheif/CVE-2026-41071-1.patch    |   34 +
>  .../libheif/libheif/CVE-2026-41071-2.patch    |   44 +
>  .../libheif/libheif/CVE-2026-62289.patch      |  189 ++
>  .../libheif/libheif/CVE-2026-62377.patch      |  175 +
>  .../libheif/libheif_1.21.2.bb                 |    8 +
>  .../firewalld/files/CVE-2026-4948.patch       |   38 +
>  .../firewalld/firewalld_2.2.3.bb              |    1 +
>  .../civetweb/civetweb_1.16.bb                 |    1 +
>  .../libiec61850/files/CVE-2026-18582.patch    |   51 +
>  .../libiec61850/files/CVE-2026-18583.patch    |   35 +
>  .../libiec61850/files/CVE-2026-19108.patch    |  208 ++
>  .../libiec61850/files/CVE-2026-19206-1.patch  |  129 +
>  .../libiec61850/files/CVE-2026-19206-2.patch  |  134 +
>  .../libiec61850/files/CVE-2026-19206-3.patch  |  115 +
>  .../libiec61850/libiec61850_1.6.1.bb          |    8 +
>  .../miniupnpd/files/CVE-2026-5720.patch       |   35 +
>  .../miniupnpd/miniupnpd_2.1.20191006.bb       |    1 +
>  .../samba/samba_4.23.11.bb                    |    3 +
>  .../wolfssl/files/CVE-2026-10098-1.patch      |  368 ++
>  .../wolfssl/files/CVE-2026-10098-2.patch      |  126 +
>  .../wolfssl/files/CVE-2026-10512.patch        |  182 +
>  .../wolfssl/files/CVE-2026-55958.patch        |   36 +
>  .../wolfssl/files/CVE-2026-6091-1.patch       |  295 ++
>  .../wolfssl/files/CVE-2026-6091-2.patch       |   30 +
>  .../wolfssl/files/CVE-2026-6091-3.patch       |   36 +
>  .../wolfssl/files/CVE-2026-6092.patch         |  163 +
>  .../wolfssl/files/CVE-2026-6094-1.patch       |   32 +
>  .../wolfssl/files/CVE-2026-6094-2.patch       |   35 +
>  .../wolfssl/files/CVE-2026-6094-3.patch       |   39 +
>  .../wolfssl/files/CVE-2026-6094-4.patch       |   36 +
>  .../wolfssl/files/CVE-2026-6094-5.patch       |   73 +
>  .../wolfssl/files/CVE-2026-6291.patch         | 2948 +++++++++++++++++
>  .../wolfssl/files/CVE-2026-6325.patch         |  123 +
>  .../wolfssl/files/CVE-2026-6412-1.patch       |  159 +
>  .../wolfssl/files/CVE-2026-6412-2.patch       |   56 +
>  .../wolfssl/files/CVE-2026-6450-1.patch       |  456 +++
>  .../wolfssl/files/CVE-2026-6450-2.patch       |  404 +++
>  .../wolfssl/files/CVE-2026-6731-1.patch       |   39 +
>  .../wolfssl/files/CVE-2026-6731-2.patch       |  171 +
>  .../wolfssl/files/CVE-2026-7531.patch         |  180 +
>  .../wolfssl/wolfssl_5.9.1.bb                  |   25 +
>  .../{proftpd_1.3.9c.bb =3D> proftpd_1.3.9d.bb}  |    2 +-
>  .../opcua/open62541/CVE-2026-11946.patch      |   48 +
>  .../opcua/open62541_1.4.16.bb                 |    1 +
>  .../recipes-support/dovecot/dovecot_2.4.4.bb  |    8 +
>  .../recipes-support/iftop/iftop_1.0pre4.bb    |    3 +
>  .../recipes-support/libldb/libldb_2.8.2.bb    |    2 +
>  .../tinyproxy/tinyproxy/CVE-2026-31842.patch  |   33 +
>  .../tinyproxy/tinyproxy/CVE-2026-54387.patch  |   37 +
>  .../tinyproxy/tinyproxy/CVE-2026-55202.patch  |  107 +
>  .../tinyproxy/tinyproxy_1.11.3.bb             |    3 +
>  .../unbound/unbound/CVE-2026-32665.patch      |  119 +
>  .../unbound/unbound/CVE-2026-32792.patch      |   31 +
>  .../unbound/unbound/CVE-2026-33278.patch      |  296 ++
>  .../unbound/unbound/CVE-2026-40622.patch      |   58 +
>  .../unbound/unbound/CVE-2026-41292.patch      |   83 +
>  .../unbound/unbound/CVE-2026-42534.patch      |   70 +
>  .../unbound/unbound/CVE-2026-42923.patch      |  114 +
>  .../unbound/unbound/CVE-2026-42944-1.patch    |   61 +
>  .../unbound/unbound/CVE-2026-42944-2.patch    |  231 ++
>  .../unbound/unbound/CVE-2026-42955.patch      |   98 +
>  .../unbound/unbound/CVE-2026-42959.patch      |   36 +
>  .../unbound/unbound/CVE-2026-42960.patch      |   38 +
>  .../unbound/unbound/CVE-2026-44390.patch      |   37 +
>  .../unbound/unbound/CVE-2026-44608.patch      |   59 +
>  .../unbound/unbound/CVE-2026-44621.patch      |   98 +
>  .../unbound/unbound/CVE-2026-44687.patch      |   31 +
>  .../unbound/unbound/CVE-2026-46582.patch      |  151 +
>  .../unbound/unbound/CVE-2026-50045.patch      |  278 ++
>  .../unbound/unbound/CVE-2026-50046.patch      |   61 +
>  .../unbound/unbound/CVE-2026-50243.patch      |   36 +
>  .../unbound/unbound/CVE-2026-50248.patch      |   77 +
>  .../unbound/unbound/CVE-2026-50251.patch      |   72 +
>  .../unbound/unbound/CVE-2026-50252.patch      | 1294 ++++++++
>  .../unbound/unbound/CVE-2026-52863.patch      |  132 +
>  .../unbound/unbound/CVE-2026-54478.patch      |   38 +
>  .../unbound/unbound/CVE-2026-55708.patch      |   51 +
>  .../unbound/unbound/CVE-2026-55717.patch      |   90 +
>  .../unbound/unbound/CVE-2026-55973.patch      |   47 +
>  .../unbound/unbound/CVE-2026-55990.patch      |   59 +
>  .../unbound/unbound/CVE-2026-55991.patch      |  112 +
>  .../unbound/unbound/CVE-2026-56416.patch      |   68 +
>  .../unbound/unbound/CVE-2026-56444.patch      |   51 +
>  .../recipes-support/unbound/unbound_1.24.2.bb |   32 +
>  .../recipes-devtools/bcc/bcc_0.36.1.bb        |    2 +
>  ...syncmqtt_10.3.0.bb =3D> asyncmqtt_10.3.1.bb} |    2 +-
>  .../hostapd/hostapd/CVE-2026-58374-1.patch    |   49 +
>  .../hostapd/hostapd/CVE-2026-58374-2.patch    |   43 +
>  .../hostapd/hostapd_2.11.bb                   |    2 +
>  .../libnfs/libnfs/CVE-2026-53689.patch        |   34 +
>  .../libnfs/libnfs/CVE-2026-57918.patch        |   34 +
>  .../libnfs/libnfs_6.0.2.bb                    |    2 +
>  .../thrift/thrift/CVE-2026-41608.patch        |  176 +
>  .../thrift/thrift/CVE-2026-45112.patch        |  306 ++
>  .../thrift/thrift/CVE-2026-48145.patch        |  137 +
>  .../thrift/thrift/CVE-2026-48586-01.patch     |  109 +
>  .../thrift/thrift/CVE-2026-48586-02.patch     |   78 +
>  .../thrift/thrift/CVE-2026-55969.patch        |  295 ++
>  .../thrift/thrift/CVE-2026-55970.patch        |   67 +
>  .../thrift/thrift/CVE-2026-58662.patch        |  120 +
>  .../thrift/thrift_0.22.0.bb                   |    8 +
>  .../zabbix/zabbix_7.0.24.bb                   |    8 +
>  .../libkcapi/libkcapi/CVE-2026-71225.patch    |   38 +
>  .../libkcapi/libkcapi/CVE-2026-71226-1.patch  |  604 ++++
>  .../libkcapi/libkcapi/CVE-2026-71226-2.patch  |   55 +
>  .../libkcapi/libkcapi/CVE-2026-71226-3.patch  |   93 +
>  .../libkcapi/libkcapi/CVE-2026-71227.patch    |   40 +
>  .../recipes-crypto/libkcapi/libkcapi_1.5.0.bb |    5 +
>  ...c-bypass-autoconf-2.69-version-check.patch |    6 +-
>  ...ostgresql_17.10.bb =3D> postgresql_17.11.bb} |    2 +-
>  .../capnproto/capnproto_1.4.0.bb              |   10 +
>  .../editorconfig-core-c/CVE-2026-40489.patch  |   39 +
>  .../editorconfig-core-c_0.12.9.bb             |    6 +-
>  meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |    2 +
>  .../php/{php_8.5.9.bb =3D> php_8.5.10.bb}       |    2 +-
>  .../0004-Allow-build-with-CMake-4.patch       |   86 +
>  ...dd-install-rpath-to-shared-libraries.patch |   37 +
>  .../suitesparse/suitesparse_5.10.1.bb         |    2 +
>  .../haveged/haveged_1.9.23.bb                 |    2 +
>  .../libyang/libyang/CVE-2026-41401.patch      |   43 +
>  .../libyang/libyang_3.13.6.bb                 |    1 +
>  .../rsyslog/CVE-2026-19654-regression.patch   |   56 +
>  .../rsyslog/rsyslog/CVE-2026-19654.patch      |   51 +
>  .../rsyslog/rsyslog_8.2512.0.bb               |    2 +
>  .../recipes-extended/valkey/valkey_9.0.5.bb   |    2 +
>  .../tesseract/tesseract/CVE-2026-73066.patch  |  152 +
>  .../tesseract/CVE-2026-73067-1.patch          |  423 +++
>  .../tesseract/CVE-2026-73067-2.patch          |   96 +
>  .../tesseract/tesseract_5.5.2.bb              |    6 +-
>  .../gpsd/gpsd/CVE-2026-58459-1.patch          |   48 +
>  .../gpsd/gpsd/CVE-2026-58459-2.patch          |   46 +
>  .../gpsd/gpsd/CVE-2026-58459-3.patch          |   58 +
>  .../recipes-navigation/gpsd/gpsd_3.27.5.bb    |    3 +
>  .../bubblewrap/bubblewrap_0.11.2.bb           |    2 +
>  .../dool/dool/CVE-2026-56651.patch            |   47 +
>  .../dool/dool/CVE-2026-56652.patch            |   35 +
>  meta-oe/recipes-support/dool/dool_1.3.8.bb    |    5 +-
>  meta-oe/recipes-support/eject/eject_2.1.5.bb  |    2 +
>  .../freeipmi/freeipmi/CVE-2026-50031-1.patch  |   33 +
>  .../freeipmi/freeipmi/CVE-2026-50031-2.patch  |   33 +
>  .../freeipmi/freeipmi_1.6.17.bb               |    5 +-
>  .../freerdp/freerdp3/CVE-2026-40254-1.patch   |   46 +
>  .../freerdp/freerdp3/CVE-2026-40254-2.patch   |   30 +
>  .../freerdp/freerdp3/CVE-2026-55191.patch     |   47 +
>  .../freerdp/freerdp3/CVE-2026-55192.patch     |   79 +
>  .../freerdp/freerdp3/CVE-2026-55193.patch     |   37 +
>  .../freerdp/freerdp3/CVE-2026-55194.patch     |   53 +
>  .../freerdp/freerdp3/CVE-2026-55564.patch     |   28 +
>  .../freerdp/freerdp3/CVE-2026-55648.patch     |   28 +
>  .../freerdp/freerdp3/CVE-2026-63633.patch     |   28 +
>  .../freerdp/freerdp3/CVE-2026-63652.patch     |   53 +
>  .../freerdp/freerdp3/CVE-2026-64620.patch     |   37 +
>  .../freerdp/freerdp3/CVE-2026-64621.patch     |   27 +
>  .../freerdp/freerdp3/CVE-2026-66401.patch     |   86 +
>  .../freerdp/freerdp3/CVE-2026-67288.patch     |   69 +
>  .../freerdp/freerdp3_3.24.2.bb                |   17 +-
>  meta-oe/recipes-support/gpm/gpm_git.bb        |    2 +
>  .../hdf5/files/CVE-2026-17572.patch           |  253 ++
>  .../hdf5/files/CVE-2026-17573.patch           |   53 +
>  .../hdf5/files/CVE-2026-17574.patch           |   65 +
>  .../hdf5/files/CVE-2026-19025.patch           |  112 +
>  meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |    4 +
>  .../iniparser/iniparser_4.2.6.bb              |    2 +
>  .../lcms/lcms/CVE-2026-42798.patch            |   38 +
>  meta-oe/recipes-support/lcms/lcms_2.18.bb     |    1 +
>  .../libfido2/libfido2-initial_1.16.0.bb       |    2 +
>  .../libfido2/libfido2_1.16.0.bb               |    2 +
>  .../recipes-support/libssh/libssh_0.11.5.bb   |   11 +
>  .../python/python3-cbor2_5.9.0.bb             |    2 +-
>  ...project-lower-setuptools-requirement.patch |   28 +
>  ...ngo_5.2.16.bb =3D> python3-django_5.2.17.bb} |    5 +-
>  .../python/python3-gunicorn_25.3.0.bb         |    2 +
>  .../python/python3-h11_0.16.0.bb              |    2 +
>  .../python3-zeroconf/CVE-2026-47180.patch     |  110 +
>  .../python3-zeroconf/CVE-2026-47183.patch     |  401 +++
>  .../python3-zeroconf/CVE-2026-47184.patch     |  558 ++++
>  .../python/python3-zeroconf_0.148.0.bb        |    5 +
>  .../recipes-httpd/nginx/nginx_1.28.3.bb       |    1 +
>  .../recipes-webadmin/cockpit/cockpit_352.bb   |    1 +
>  188 files changed, 17895 insertions(+), 16 deletions(-)
>  create mode 100644
> meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49337.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49346.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32738.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32739.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32740.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32741.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-41071-1.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-41071-2.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-62289.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-62377.patch
>  create mode 100644
> meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld=
/files/CVE-2026-4948.patch
>  create mode 100644
> meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-18582.pat=
ch
>  create mode 100644
> meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-18583.pat=
ch
>  create mode 100644
> meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19108.pat=
ch
>  create mode 100644
> meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19206-1.p=
atch
>  create mode 100644
> meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19206-2.p=
atch
>  create mode 100644
> meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19206-3.p=
atch
>  create mode 100644
> meta-networking/recipes-connectivity/miniupnpd/files/CVE-2026-5720.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-10098-1.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-10098-2.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-10512.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-55958.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6091-1.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6091-2.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6091-3.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6092.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-1.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-2.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-3.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-4.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6094-5.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6291.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6325.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6412-1.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6412-2.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6450-1.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6450-2.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6731-1.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-6731-2.patch
>  create mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-7531.patch
>  rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9c.bb =3D>
> proftpd_1.3.9d.bb} (99%)
>  create mode 100644
> meta-networking/recipes-protocols/opcua/open62541/CVE-2026-11946.patch
>  create mode 100644
> meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-31842.patch
>  create mode 100644
> meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54387.patch
>  create mode 100644
> meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-55202.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-32665.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-32792.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-33278.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-40622.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-41292.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-42534.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-42923.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-42944-1.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-42944-2.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-42955.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-42959.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-42960.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-44390.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-44608.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-44621.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-44687.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-46582.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-50045.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-50046.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-50243.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-50248.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-50251.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-50252.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-52863.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-54478.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-55708.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-55717.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-55973.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-55990.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-55991.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-56416.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-56444.patch
>  rename meta-oe/recipes-connectivity/asyncmqtt/{asyncmqtt_10.3.0.bb =3D>
> asyncmqtt_10.3.1.bb} (87%)
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2026-58374-1.patch
>  create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2026-58374-2.patch
>  create mode 100644
> meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-53689.patch
>  create mode 100644
> meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-57918.patch
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-41608.patch
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-45112.patch
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48145.patch
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-01.patch
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48586-02.patch
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55969.patch
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55970.patch
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58662.patch
>  create mode 100644
> meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-71225.patch
>  create mode 100644
> meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-71226-1.patch
>  create mode 100644
> meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-71226-2.patch
>  create mode 100644
> meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-71226-3.patch
>  create mode 100644
> meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-71227.patch
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_17.10.bb =3D>
> postgresql_17.11.bb} (87%)
>  create mode 100644
> meta-oe/recipes-devtools/editorconfig/editorconfig-core-c/CVE-2026-40489.=
patch
>  rename meta-oe/recipes-devtools/php/{php_8.5.9.bb =3D> php_8.5.10.bb} (9=
9%)
>  create mode 100644
> meta-oe/recipes-devtools/suitesparse/suitesparse/0004-Allow-build-with-CM=
ake-4.patch
>  create mode 100644
> meta-oe/recipes-devtools/suitesparse/suitesparse/0005-Do-not-add-install-=
rpath-to-shared-libraries.patch
>  create mode 100644
> meta-oe/recipes-extended/libyang/libyang/CVE-2026-41401.patch
>  create mode 100644
> meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654-regression.patch
>  create mode 100644
> meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-19654.patch
>  create mode 100644
> meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-73066.patch
>  create mode 100644
> meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-73067-1.patch
>  create mode 100644
> meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-73067-2.patch
>  create mode 100644
> meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-1.patch
>  create mode 100644
> meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-2.patch
>  create mode 100644
> meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-3.patch
>  create mode 100644 meta-oe/recipes-support/dool/dool/CVE-2026-56651.patc=
h
>  create mode 100644 meta-oe/recipes-support/dool/dool/CVE-2026-56652.patc=
h
>  create mode 100644
> meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-50031-1.patch
>  create mode 100644
> meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-50031-2.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-40254-1.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-40254-2.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55191.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55192.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55193.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55194.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55564.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55648.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-63633.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-63652.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-64620.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-64621.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-66401.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-67288.patch
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17572.pat=
ch
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17573.pat=
ch
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17574.pat=
ch
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19025.pat=
ch
>  create mode 100644 meta-oe/recipes-support/lcms/lcms/CVE-2026-42798.patc=
h
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/0001-pyproject-lower-s=
etuptools-requirement.patch
>  rename meta-python/recipes-devtools/python/{python3-django_5.2.16.bb =3D=
>
> python3-django_5.2.17.bb} (42%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-zeroconf/CVE-2026-47180.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-zeroconf/CVE-2026-47183.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-zeroconf/CVE-2026-47184.patch
>
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130034):
> https://lists.openembedded.org/g/openembedded-devel/message/130034
> Mute This Topic: https://lists.openembedded.org/mt/121257153/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009b0192065bdd7c47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">LGTM, merged now<div><br></div><div>Thanks</div></div><br>=
<div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"=
gmail_attr">On Mon, Sep 14, 2026 at 11:09=E2=80=AFPM Anuj Mittal via <a hre=
f=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;anuj.mit=
tal=3D<a href=3D"mailto:oss.qualcomm.com@lists.openembedded.org">oss.qualco=
mm.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Please merge these changes in wrynose. Tested =
on autobuilder and locally.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1803" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1803</a><br>
<br>
The following changes since commit 14282a02be9c74a1276a7cda7d6c89e054699a11=
:<br>
<br>
=C2=A0 libhtml-tree-perl, libmodule-build-tiny-perl: Drop obsolete TMPDIR s=
crubbing (2026-08-26 07:13:01 +0530)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> anujm/wrynose<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Danujm/wrynose" rel=3D"noreferrer" target=3D"_blank">https://git.open=
embedded.org/meta-openembedded-contrib/log/?h=3Danujm/wrynose</a><br>
<br>
for you to fetch changes up to 2d08f417301392ef61a7527448207db2eba09845:<br=
>
<br>
=C2=A0 unbound: patch CVE-2026-56444 (2026-09-15 07:52:54 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Abhishek Bachiphale (3):<br>
=C2=A0 thrift: fix CVE-2026-58662<br>
=C2=A0 thrift: fix CVE-2026-48586<br>
=C2=A0 thrift: fix CVE-2026-48145<br>
<br>
Adarsh Jagadish Kamini (4):<br>
=C2=A0 thrift: fix CVE-2026-41608<br>
=C2=A0 thrift: fix CVE-2026-45112<br>
=C2=A0 thrift: fix CVE-2026-55969<br>
=C2=A0 thrift: fix CVE-2026-55970<br>
<br>
Ankur Tyagi (127):<br>
=C2=A0 python3-django: upgrade 5.2.16 -&gt; 5.2.17<br>
=C2=A0 asyncmqtt: upgrade 10.3.0 -&gt; 10.3.1<br>
=C2=A0 proftpd: upgrade 1.3.9c -&gt; 1.3.9d<br>
=C2=A0 capnproto: ignore CVE-2026-59704<br>
=C2=A0 bubblewrap: mark CVE-2026-41163 patched<br>
=C2=A0 bcc: mark CVE-2024-2314 patched<br>
=C2=A0 cockpit: mark CVE-2024-2947 patched<br>
=C2=A0 dool: patch CVE-2026-56651<br>
=C2=A0 dool: patch CVE-2026-56652<br>
=C2=A0 dovecot: ignore already fixed CVEs<br>
=C2=A0 editorconfig-core-c: ignore CVE-2024-53849<br>
=C2=A0 editorconfig-core-c: patch CVE-2026-40489<br>
=C2=A0 civetweb: ignore CVE-2026-5789<br>
=C2=A0 eject: ignore CVE-2026-28065<br>
=C2=A0 firewalld: patch CVE-2026-4948<br>
=C2=A0 freeipmi: patch CVE-2026-50031<br>
=C2=A0 haveged: ignore CVE-2026-41054<br>
=C2=A0 gpm: ignore CVE-2025-4558<br>
=C2=A0 gpsd: patch CVE-2026-58459<br>
=C2=A0 gerbera: ignore CVE-2025-23386<br>
=C2=A0 hostapd: patch CVE-2026-58374<br>
=C2=A0 hdf5: patch CVE-2026-17572<br>
=C2=A0 hdf5: patch CVE-2026-17573<br>
=C2=A0 hdf5: patch CVE-2026-17574<br>
=C2=A0 hdf5: patch CVE-2026-19025<br>
=C2=A0 iftop: ignore CVE-2026-3824, CVE-2026-3825 and CVE-2026-3826<br>
=C2=A0 iniparser: mark CVE-2025-0633 pached<br>
=C2=A0 jq: ignore CVE-2025-49014<br>
=C2=A0 lcms: patch CVE-2026-42798<br>
=C2=A0 libde265: mark CVE-2026-45382 and CVE-2026-45383 patched<br>
=C2=A0 libde265: patch CVE-2026-49295<br>
=C2=A0 libde265: patch CVE-2026-49337<br>
=C2=A0 libde265: patch CVE-2026-49346<br>
=C2=A0 libfido2, libfido2-initial: ignore CVE-2026-40947<br>
=C2=A0 libheif: patch CVE-2026-32738<br>
=C2=A0 libheif: patch CVE-2026-32739<br>
=C2=A0 libheif: patch CVE-2026-32740<br>
=C2=A0 libheif: patch CVE-2026-32741<br>
=C2=A0 libheif: patch CVE-2026-41071<br>
=C2=A0 libheif: patch CVE-2026-62289<br>
=C2=A0 libheif: patch CVE-2026-62377<br>
=C2=A0 libiec61850: mark CVE-2024-45969 patched<br>
=C2=A0 libiec61850: patch CVE-2026-18582<br>
=C2=A0 libiec61850: patch CVE-2026-18583<br>
=C2=A0 libiec61850: patch CVE-2026-19108<br>
=C2=A0 libiec61850: patch CVE-2026-19206<br>
=C2=A0 libkcapi: patch CVE-2026-71226<br>
=C2=A0 libkcapi: patch CVE-2026-71227<br>
=C2=A0 libkcapi: patch CVE-2026-71225<br>
=C2=A0 libnfs: patch CVE-2026-53689<br>
=C2=A0 libnfs: patch CVE-2026-57918<br>
=C2=A0 libssh: ignore CVE-2025-14821<br>
=C2=A0 libssh: mark CVEs patched<br>
=C2=A0 miniupnpd: patch CVE-2026-5720<br>
=C2=A0 python3-zeroconf: patch CVE-2026-47180<br>
=C2=A0 python3-zeroconf: patch CVE-2026-47183<br>
=C2=A0 python3-zeroconf: patch CVE-2026-47184<br>
=C2=A0 valkey: mark CVE-2026-56684 and CVE-2026-63639 patched<br>
=C2=A0 libyang: patch CVE-2026-41401<br>
=C2=A0 tinyproxy: patch CVE-2026-31842<br>
=C2=A0 tinyproxy: patch CVE-2026-54387<br>
=C2=A0 tinyproxy: patch CVE-2026-55202<br>
=C2=A0 nginx: mark CVE-2026-1642 patched<br>
=C2=A0 open62541: patch CVE-2026-11946<br>
=C2=A0 tesseract: patch CVE-2026-73066<br>
=C2=A0 tesseract: patch CVE-2026-73067<br>
=C2=A0 wolfssl: mark CVEs patched<br>
=C2=A0 wolfssl: patch CVE-2026-10098<br>
=C2=A0 wolfssl: patch CVE-2026-10512<br>
=C2=A0 wolfssl: ignore CVE-2026-12340<br>
=C2=A0 wolfssl: patch CVE-2026-55958<br>
=C2=A0 wolfssl: patch CVE-2026-6091<br>
=C2=A0 wolfssl: patch CVE-2026-6092<br>
=C2=A0 wolfssl: patch CVE-2026-6094<br>
=C2=A0 wolfssl: patch CVE-2026-6291<br>
=C2=A0 wolfssl: patch CVE-2026-6325<br>
=C2=A0 wolfssl: patch CVE-2026-6412<br>
=C2=A0 wolfssl: patch CVE-2026-6450<br>
=C2=A0 wolfssl: patch CVE-2026-6731<br>
=C2=A0 wolfssl: patch CVE-2026-7531<br>
=C2=A0 freerdp3: patch CVE-2026-40254<br>
=C2=A0 freerdp3: patch CVE-2026-55191<br>
=C2=A0 freerdp3: patch CVE-2026-55192<br>
=C2=A0 freerdp3: patch CVE-2026-55193<br>
=C2=A0 freerdp3: patch CVE-2026-55194<br>
=C2=A0 freerdp3: patch CVE-2026-55564<br>
=C2=A0 freerdp3: patch CVE-2026-55648<br>
=C2=A0 freerdp3: patch CVE-2026-63633<br>
=C2=A0 freerdp3: patch CVE-2026-63652<br>
=C2=A0 freerdp3: patch CVE-2026-64620<br>
=C2=A0 freerdp3: patch CVE-2026-64621<br>
=C2=A0 freerdp3: patch CVE-2026-66401<br>
=C2=A0 freerdp3: patch CVE-2026-67288<br>
=C2=A0 python3-gunicorn: mark CVE-2024-1135 patched<br>
=C2=A0 python3-h11: mark CVE-2025-43859 patched<br>
=C2=A0 zabbix: ignore multiple CVEs<br>
=C2=A0 unbound: patch CVE-2026-33278<br>
=C2=A0 unbound: patch CVE-2026-42944<br>
=C2=A0 unbound: patch CVE-2026-42959<br>
=C2=A0 unbound: patch CVE-2026-32792<br>
=C2=A0 unbound: patch CVE-2026-40622<br>
=C2=A0 unbound: patch CVE-2026-41292<br>
=C2=A0 unbound: patch CVE-2026-42534<br>
=C2=A0 unbound: patch CVE-2026-42923<br>
=C2=A0 unbound: patch CVE-2026-42960<br>
=C2=A0 unbound: patch CVE-2026-44390<br>
=C2=A0 unbound: patch CVE-2026-44608<br>
=C2=A0 unbound: patch CVE-2026-46582<br>
=C2=A0 unbound: patch CVE-2026-32665<br>
=C2=A0 unbound: patch CVE-2026-42955<br>
=C2=A0 unbound: patch CVE-2026-44621<br>
=C2=A0 unbound: patch CVE-2026-44687<br>
=C2=A0 unbound: patch CVE-2026-50045<br>
=C2=A0 unbound: patch CVE-2026-50046<br>
=C2=A0 unbound: patch CVE-2026-50243<br>
=C2=A0 unbound: patch CVE-2026-50248<br>
=C2=A0 unbound: patch CVE-2026-50251<br>
=C2=A0 unbound: patch CVE-2026-50252<br>
=C2=A0 unbound: patch CVE-2026-52863<br>
=C2=A0 unbound: patch CVE-2026-54478<br>
=C2=A0 unbound: patch CVE-2026-55708<br>
=C2=A0 unbound: patch CVE-2026-55717<br>
=C2=A0 unbound: patch CVE-2026-55973<br>
=C2=A0 unbound: patch CVE-2026-55990<br>
=C2=A0 unbound: patch CVE-2026-55991<br>
=C2=A0 unbound: patch CVE-2026-56416<br>
=C2=A0 unbound: patch CVE-2026-56444<br>
<br>
Deepak Rathore (1):<br>
=C2=A0 rsyslog: Fix CVE-2026-19654<br>
<br>
Devansh Patel (1):<br>
=C2=A0 python3-cbor2: use exact CVE_PRODUCT mapping<br>
<br>
Himanshu Jadon (3):<br>
=C2=A0 suitesparse: fix CMake 4 configure failure<br>
=C2=A0 suitesparse: avoid install rpath buildpaths QA<br>
=C2=A0 samba, libldb: add package conflicts<br>
<br>
Jason Schonberg (1):<br>
=C2=A0 php: upgrade 8.5.9 -&gt; 8.5.10<br>
<br>
Joel Winarske (1):<br>
=C2=A0 capnproto: build position independent code<br>
<br>
Omkar Patil (1):<br>
=C2=A0 postgresql: upgrade 17.10 -&gt; 17.11<br>
<br>
=C2=A0.../gerbera/<a href=3D"http://gerbera_3.0.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gerbera_3.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0.../libde265/libde265/CVE-2026-49295.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A041 +<br>
=C2=A0.../libde265/libde265/CVE-2026-49337.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A053 +<br>
=C2=A0.../libde265/libde265/CVE-2026-49346.patch=C2=A0 =C2=A0 |=C2=A0 102 +=
<br>
=C2=A0.../libde265/<a href=3D"http://libde265_1.0.19.bb" rel=3D"noreferrer"=
 target=3D"_blank">libde265_1.0.19.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 9 +-<br>
=C2=A0.../libheif/libheif/CVE-2026-32738.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A032 +<br>
=C2=A0.../libheif/libheif/CVE-2026-32739.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A054 +<br>
=C2=A0.../libheif/libheif/CVE-2026-32740.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A040 +<br>
=C2=A0.../libheif/libheif/CVE-2026-32741.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A029 +<br>
=C2=A0.../libheif/libheif/CVE-2026-41071-1.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A034 +<br>
=C2=A0.../libheif/libheif/CVE-2026-41071-2.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A044 +<br>
=C2=A0.../libheif/libheif/CVE-2026-62289.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
189 ++<br>
=C2=A0.../libheif/libheif/CVE-2026-62377.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
175 +<br>
=C2=A0.../libheif/<a href=3D"http://libheif_1.21.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libheif_1.21.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +<br>
=C2=A0.../firewalld/files/CVE-2026-4948.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A038 +<br>
=C2=A0.../firewalld/<a href=3D"http://firewalld_2.2.3.bb" rel=3D"noreferrer=
" target=3D"_blank">firewalld_2.2.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0.../civetweb/<a href=3D"http://civetweb_1.16.bb" rel=3D"noreferrer" t=
arget=3D"_blank">civetweb_1.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0.../libiec61850/files/CVE-2026-18582.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A051 +<br>
=C2=A0.../libiec61850/files/CVE-2026-18583.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A035 +<br>
=C2=A0.../libiec61850/files/CVE-2026-19108.patch=C2=A0 =C2=A0 |=C2=A0 208 +=
+<br>
=C2=A0.../libiec61850/files/CVE-2026-19206-1.patch=C2=A0 |=C2=A0 129 +<br>
=C2=A0.../libiec61850/files/CVE-2026-19206-2.patch=C2=A0 |=C2=A0 134 +<br>
=C2=A0.../libiec61850/files/CVE-2026-19206-3.patch=C2=A0 |=C2=A0 115 +<br>
=C2=A0.../libiec61850/<a href=3D"http://libiec61850_1.6.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">libiec61850_1.6.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A0 8 +<br>
=C2=A0.../miniupnpd/files/CVE-2026-5720.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A035 +<br>
=C2=A0.../miniupnpd/<a href=3D"http://miniupnpd_2.1.20191006.bb" rel=3D"nor=
eferrer" target=3D"_blank">miniupnpd_2.1.20191006.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0.../samba/<a href=3D"http://samba_4.23.11.bb" rel=3D"noreferrer" targ=
et=3D"_blank">samba_4.23.11.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +<br>
=C2=A0.../wolfssl/files/CVE-2026-10098-1.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
368 ++<br>
=C2=A0.../wolfssl/files/CVE-2026-10098-2.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
126 +<br>
=C2=A0.../wolfssl/files/CVE-2026-10512.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 182 +<br>
=C2=A0.../wolfssl/files/CVE-2026-55958.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A036 +<br>
=C2=A0.../wolfssl/files/CVE-2026-6091-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 295 ++<br>
=C2=A0.../wolfssl/files/CVE-2026-6091-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A030 +<br>
=C2=A0.../wolfssl/files/CVE-2026-6091-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A036 +<br>
=C2=A0.../wolfssl/files/CVE-2026-6092.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 163 +<br>
=C2=A0.../wolfssl/files/CVE-2026-6094-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A032 +<br>
=C2=A0.../wolfssl/files/CVE-2026-6094-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A035 +<br>
=C2=A0.../wolfssl/files/CVE-2026-6094-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A039 +<br>
=C2=A0.../wolfssl/files/CVE-2026-6094-4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A036 +<br>
=C2=A0.../wolfssl/files/CVE-2026-6094-5.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A073 +<br>
=C2=A0.../wolfssl/files/CVE-2026-6291.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2948 +++++++++++++++++<br>
=C2=A0.../wolfssl/files/CVE-2026-6325.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 123 +<br>
=C2=A0.../wolfssl/files/CVE-2026-6412-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 159 +<br>
=C2=A0.../wolfssl/files/CVE-2026-6412-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A056 +<br>
=C2=A0.../wolfssl/files/CVE-2026-6450-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 456 +++<br>
=C2=A0.../wolfssl/files/CVE-2026-6450-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 404 +++<br>
=C2=A0.../wolfssl/files/CVE-2026-6731-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A039 +<br>
=C2=A0.../wolfssl/files/CVE-2026-6731-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 171 +<br>
=C2=A0.../wolfssl/files/CVE-2026-7531.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 180 +<br>
=C2=A0.../wolfssl/<a href=3D"http://wolfssl_5.9.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">wolfssl_5.9.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A025 +<br>
=C2=A0.../{<a href=3D"http://proftpd_1.3.9c.bb" rel=3D"noreferrer" target=
=3D"_blank">proftpd_1.3.9c.bb</a> =3D&gt; <a href=3D"http://proftpd_1.3.9d.=
bb" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.9d.bb</a>}=C2=A0 |=C2=
=A0 =C2=A0 2 +-<br>
=C2=A0.../opcua/open62541/CVE-2026-11946.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A048 +<br>
=C2=A0.../opcua/<a href=3D"http://open62541_1.4.16.bb" rel=3D"noreferrer" t=
arget=3D"_blank">open62541_1.4.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0.../recipes-support/dovecot/<a href=3D"http://dovecot_2.4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">dovecot_2.4.4.bb</a>=C2=A0 |=C2=A0 =C2=A0=
 8 +<br>
=C2=A0.../recipes-support/iftop/<a href=3D"http://iftop_1.0pre4.bb" rel=3D"=
noreferrer" target=3D"_blank">iftop_1.0pre4.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 3 +<br>
=C2=A0.../recipes-support/libldb/<a href=3D"http://libldb_2.8.2.bb" rel=3D"=
noreferrer" target=3D"_blank">libldb_2.8.2.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 2 +<br>
=C2=A0.../tinyproxy/tinyproxy/CVE-2026-31842.patch=C2=A0 |=C2=A0 =C2=A033 +=
<br>
=C2=A0.../tinyproxy/tinyproxy/CVE-2026-54387.patch=C2=A0 |=C2=A0 =C2=A037 +=
<br>
=C2=A0.../tinyproxy/tinyproxy/CVE-2026-55202.patch=C2=A0 |=C2=A0 107 +<br>
=C2=A0.../tinyproxy/<a href=3D"http://tinyproxy_1.11.3.bb" rel=3D"noreferre=
r" target=3D"_blank">tinyproxy_1.11.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 3 +<br>
=C2=A0.../unbound/unbound/CVE-2026-32665.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
119 +<br>
=C2=A0.../unbound/unbound/CVE-2026-32792.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A031 +<br>
=C2=A0.../unbound/unbound/CVE-2026-33278.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
296 ++<br>
=C2=A0.../unbound/unbound/CVE-2026-40622.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A058 +<br>
=C2=A0.../unbound/unbound/CVE-2026-41292.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A083 +<br>
=C2=A0.../unbound/unbound/CVE-2026-42534.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A070 +<br>
=C2=A0.../unbound/unbound/CVE-2026-42923.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
114 +<br>
=C2=A0.../unbound/unbound/CVE-2026-42944-1.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A061 +<br>
=C2=A0.../unbound/unbound/CVE-2026-42944-2.patch=C2=A0 =C2=A0 |=C2=A0 231 +=
+<br>
=C2=A0.../unbound/unbound/CVE-2026-42955.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A098 +<br>
=C2=A0.../unbound/unbound/CVE-2026-42959.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A036 +<br>
=C2=A0.../unbound/unbound/CVE-2026-42960.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A038 +<br>
=C2=A0.../unbound/unbound/CVE-2026-44390.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A037 +<br>
=C2=A0.../unbound/unbound/CVE-2026-44608.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A059 +<br>
=C2=A0.../unbound/unbound/CVE-2026-44621.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A098 +<br>
=C2=A0.../unbound/unbound/CVE-2026-44687.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A031 +<br>
=C2=A0.../unbound/unbound/CVE-2026-46582.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
151 +<br>
=C2=A0.../unbound/unbound/CVE-2026-50045.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
278 ++<br>
=C2=A0.../unbound/unbound/CVE-2026-50046.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A061 +<br>
=C2=A0.../unbound/unbound/CVE-2026-50243.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A036 +<br>
=C2=A0.../unbound/unbound/CVE-2026-50248.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A077 +<br>
=C2=A0.../unbound/unbound/CVE-2026-50251.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A072 +<br>
=C2=A0.../unbound/unbound/CVE-2026-50252.patch=C2=A0 =C2=A0 =C2=A0 | 1294 +=
+++++++<br>
=C2=A0.../unbound/unbound/CVE-2026-52863.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
132 +<br>
=C2=A0.../unbound/unbound/CVE-2026-54478.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A038 +<br>
=C2=A0.../unbound/unbound/CVE-2026-55708.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A051 +<br>
=C2=A0.../unbound/unbound/CVE-2026-55717.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A090 +<br>
=C2=A0.../unbound/unbound/CVE-2026-55973.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A047 +<br>
=C2=A0.../unbound/unbound/CVE-2026-55990.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A059 +<br>
=C2=A0.../unbound/unbound/CVE-2026-55991.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
112 +<br>
=C2=A0.../unbound/unbound/CVE-2026-56416.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A068 +<br>
=C2=A0.../unbound/unbound/CVE-2026-56444.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A051 +<br>
=C2=A0.../recipes-support/unbound/<a href=3D"http://unbound_1.24.2.bb" rel=
=3D"noreferrer" target=3D"_blank">unbound_1.24.2.bb</a> |=C2=A0 =C2=A032 +<=
br>
=C2=A0.../recipes-devtools/bcc/<a href=3D"http://bcc_0.36.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">bcc_0.36.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 2 +<br>
=C2=A0...<a href=3D"http://syncmqtt_10.3.0.bb" rel=3D"noreferrer" target=3D=
"_blank">syncmqtt_10.3.0.bb</a> =3D&gt; <a href=3D"http://asyncmqtt_10.3.1.=
bb" rel=3D"noreferrer" target=3D"_blank">asyncmqtt_10.3.1.bb</a>} |=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0.../hostapd/hostapd/CVE-2026-58374-1.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A049 +<br>
=C2=A0.../hostapd/hostapd/CVE-2026-58374-2.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A043 +<br>
=C2=A0.../hostapd/<a href=3D"http://hostapd_2.11.bb" rel=3D"noreferrer" tar=
get=3D"_blank">hostapd_2.11.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0.../libnfs/libnfs/CVE-2026-53689.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A034 +<br>
=C2=A0.../libnfs/libnfs/CVE-2026-57918.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A034 +<br>
=C2=A0.../libnfs/<a href=3D"http://libnfs_6.0.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">libnfs_6.0.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0.../thrift/thrift/CVE-2026-41608.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 176 +<br>
=C2=A0.../thrift/thrift/CVE-2026-45112.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 306 ++<br>
=C2=A0.../thrift/thrift/CVE-2026-48145.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 137 +<br>
=C2=A0.../thrift/thrift/CVE-2026-48586-01.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
109 +<br>
=C2=A0.../thrift/thrift/CVE-2026-48586-02.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A078 +<br>
=C2=A0.../thrift/thrift/CVE-2026-55969.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 295 ++<br>
=C2=A0.../thrift/thrift/CVE-2026-55970.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A067 +<br>
=C2=A0.../thrift/thrift/CVE-2026-58662.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 120 +<br>
=C2=A0.../thrift/<a href=3D"http://thrift_0.22.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">thrift_0.22.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +<br>
=C2=A0.../zabbix/<a href=3D"http://zabbix_7.0.24.bb" rel=3D"noreferrer" tar=
get=3D"_blank">zabbix_7.0.24.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +<br>
=C2=A0.../libkcapi/libkcapi/CVE-2026-71225.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A038 +<br>
=C2=A0.../libkcapi/libkcapi/CVE-2026-71226-1.patch=C2=A0 |=C2=A0 604 ++++<b=
r>
=C2=A0.../libkcapi/libkcapi/CVE-2026-71226-2.patch=C2=A0 |=C2=A0 =C2=A055 +=
<br>
=C2=A0.../libkcapi/libkcapi/CVE-2026-71226-3.patch=C2=A0 |=C2=A0 =C2=A093 +=
<br>
=C2=A0.../libkcapi/libkcapi/CVE-2026-71227.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A040 +<br>
=C2=A0.../recipes-crypto/libkcapi/<a href=3D"http://libkcapi_1.5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libkcapi_1.5.0.bb</a> |=C2=A0 =C2=A0 5 +<=
br>
=C2=A0...c-bypass-autoconf-2.69-version-check.patch |=C2=A0 =C2=A0 6 +-<br>
=C2=A0...<a href=3D"http://ostgresql_17.10.bb" rel=3D"noreferrer" target=3D=
"_blank">ostgresql_17.10.bb</a> =3D&gt; <a href=3D"http://postgresql_17.11.=
bb" rel=3D"noreferrer" target=3D"_blank">postgresql_17.11.bb</a>} |=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0.../capnproto/<a href=3D"http://capnproto_1.4.0.bb" rel=3D"noreferrer=
" target=3D"_blank">capnproto_1.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A010 +<br>
=C2=A0.../editorconfig-core-c/CVE-2026-40489.patch=C2=A0 |=C2=A0 =C2=A039 +=
<br>
=C2=A0.../<a href=3D"http://editorconfig-core-c_0.12.9.bb" rel=3D"noreferre=
r" target=3D"_blank">editorconfig-core-c_0.12.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 6 +-<br>
=C2=A0meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.8.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">jq_1.8.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 2 +<br>
=C2=A0.../php/{<a href=3D"http://php_8.5.9.bb" rel=3D"noreferrer" target=3D=
"_blank">php_8.5.9.bb</a> =3D&gt; <a href=3D"http://php_8.5.10.bb" rel=3D"n=
oreferrer" target=3D"_blank">php_8.5.10.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../0004-Allow-build-with-CMake-4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A086 +<br>
=C2=A0...dd-install-rpath-to-shared-libraries.patch |=C2=A0 =C2=A037 +<br>
=C2=A0.../suitesparse/<a href=3D"http://suitesparse_5.10.1.bb" rel=3D"noref=
errer" target=3D"_blank">suitesparse_5.10.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0.../haveged/<a href=3D"http://haveged_1.9.23.bb" rel=3D"noreferrer" t=
arget=3D"_blank">haveged_1.9.23.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0.../libyang/libyang/CVE-2026-41401.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A043 +<br>
=C2=A0.../libyang/<a href=3D"http://libyang_3.13.6.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libyang_3.13.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0.../rsyslog/CVE-2026-19654-regression.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A056 +<br>
=C2=A0.../rsyslog/rsyslog/CVE-2026-19654.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A051 +<br>
=C2=A0.../rsyslog/<a href=3D"http://rsyslog_8.2512.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">rsyslog_8.2512.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0.../recipes-extended/valkey/<a href=3D"http://valkey_9.0.5.bb" rel=3D=
"noreferrer" target=3D"_blank">valkey_9.0.5.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 2 +<br>
=C2=A0.../tesseract/tesseract/CVE-2026-73066.patch=C2=A0 |=C2=A0 152 +<br>
=C2=A0.../tesseract/CVE-2026-73067-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 423 +++<br>
=C2=A0.../tesseract/CVE-2026-73067-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A096 +<br>
=C2=A0.../tesseract/<a href=3D"http://tesseract_5.5.2.bb" rel=3D"noreferrer=
" target=3D"_blank">tesseract_5.5.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 6 +-<br>
=C2=A0.../gpsd/gpsd/CVE-2026-58459-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A048 +<br>
=C2=A0.../gpsd/gpsd/CVE-2026-58459-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A046 +<br>
=C2=A0.../gpsd/gpsd/CVE-2026-58459-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A058 +<br>
=C2=A0.../recipes-navigation/gpsd/<a href=3D"http://gpsd_3.27.5.bb" rel=3D"=
noreferrer" target=3D"_blank">gpsd_3.27.5.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 3 +<br>
=C2=A0.../bubblewrap/<a href=3D"http://bubblewrap_0.11.2.bb" rel=3D"norefer=
rer" target=3D"_blank">bubblewrap_0.11.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0.../dool/dool/CVE-2026-56651.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A047 +<br>
=C2=A0.../dool/dool/CVE-2026-56652.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A035 +<br>
=C2=A0meta-oe/recipes-support/dool/<a href=3D"http://dool_1.3.8.bb" rel=3D"=
noreferrer" target=3D"_blank">dool_1.3.8.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0=
 5 +-<br>
=C2=A0meta-oe/recipes-support/eject/<a href=3D"http://eject_2.1.5.bb" rel=
=3D"noreferrer" target=3D"_blank">eject_2.1.5.bb</a>=C2=A0 |=C2=A0 =C2=A0 2=
 +<br>
=C2=A0.../freeipmi/freeipmi/CVE-2026-50031-1.patch=C2=A0 |=C2=A0 =C2=A033 +=
<br>
=C2=A0.../freeipmi/freeipmi/CVE-2026-50031-2.patch=C2=A0 |=C2=A0 =C2=A033 +=
<br>
=C2=A0.../freeipmi/<a href=3D"http://freeipmi_1.6.17.bb" rel=3D"noreferrer"=
 target=3D"_blank">freeipmi_1.6.17.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 5 +-<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-40254-1.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A046 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-40254-2.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A030 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-55191.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A047 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-55192.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A079 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-55193.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A037 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-55194.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A053 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-55564.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A028 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-55648.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A028 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-63633.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A028 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-63652.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A053 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-64620.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A037 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-64621.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A027 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-66401.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A086 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-67288.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A069 +<br>
=C2=A0.../freerdp/<a href=3D"http://freerdp3_3.24.2.bb" rel=3D"noreferrer" =
target=3D"_blank">freerdp3_3.24.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A017 +-<br>
=C2=A0meta-oe/recipes-support/gpm/<a href=3D"http://gpm_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">gpm_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A0 2 +<br>
=C2=A0.../hdf5/files/CVE-2026-17572.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 253 ++<br>
=C2=A0.../hdf5/files/CVE-2026-17573.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A053 +<br>
=C2=A0.../hdf5/files/CVE-2026-17574.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A065 +<br>
=C2=A0.../hdf5/files/CVE-2026-19025.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 112 +<br>
=C2=A0meta-oe/recipes-support/hdf5/<a href=3D"http://hdf5_2.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">hdf5_2.0.0.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0=
 4 +<br>
=C2=A0.../iniparser/<a href=3D"http://iniparser_4.2.6.bb" rel=3D"noreferrer=
" target=3D"_blank">iniparser_4.2.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0.../lcms/lcms/CVE-2026-42798.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A038 +<br>
=C2=A0meta-oe/recipes-support/lcms/<a href=3D"http://lcms_2.18.bb" rel=3D"n=
oreferrer" target=3D"_blank">lcms_2.18.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0 1 +<br>
=C2=A0.../libfido2/<a href=3D"http://libfido2-initial_1.16.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">libfido2-initial_1.16.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0.../libfido2/<a href=3D"http://libfido2_1.16.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">libfido2_1.16.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0.../recipes-support/libssh/<a href=3D"http://libssh_0.11.5.bb" rel=3D=
"noreferrer" target=3D"_blank">libssh_0.11.5.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A011 +<br>
=C2=A0.../python/<a href=3D"http://python3-cbor2_5.9.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-cbor2_5.9.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0...project-lower-setuptools-requirement.patch |=C2=A0 =C2=A028 +<br>
=C2=A0...<a href=3D"http://ngo_5.2.16.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ngo_5.2.16.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.17.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-django_5.2.17.bb</a>} |=C2=A0 =
=C2=A0 5 +-<br>
=C2=A0.../python/<a href=3D"http://python3-gunicorn_25.3.0.bb" rel=3D"noref=
errer" target=3D"_blank">python3-gunicorn_25.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0.../python/<a href=3D"http://python3-h11_0.16.0.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-h11_0.16.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0.../python3-zeroconf/CVE-2026-47180.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
110 +<br>
=C2=A0.../python3-zeroconf/CVE-2026-47183.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
401 +++<br>
=C2=A0.../python3-zeroconf/CVE-2026-47184.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
558 ++++<br>
=C2=A0.../python/<a href=3D"http://python3-zeroconf_0.148.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-zeroconf_0.148.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 5 +<br>
=C2=A0.../recipes-httpd/nginx/<a href=3D"http://nginx_1.28.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">nginx_1.28.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 1 +<br>
=C2=A0.../recipes-webadmin/cockpit/<a href=3D"http://cockpit_352.bb" rel=3D=
"noreferrer" target=3D"_blank">cockpit_352.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 1 +<br>
=C2=A0188 files changed, 17895 insertions(+), 16 deletions(-)<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde2=
65/CVE-2026-49295.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde2=
65/CVE-2026-49337.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde2=
65/CVE-2026-49346.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif=
/CVE-2026-32738.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif=
/CVE-2026-32739.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif=
/CVE-2026-32740.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif=
/CVE-2026-32741.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif=
/CVE-2026-41071-1.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif=
/CVE-2026-41071-2.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif=
/CVE-2026-62289.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif=
/CVE-2026-62377.patch<br>
=C2=A0create mode 100644 meta-networking/dynamic-layers/meta-python/recipes=
-connectivity/firewalld/files/CVE-2026-4948.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/libiec61850/f=
iles/CVE-2026-18582.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/libiec61850/f=
iles/CVE-2026-18583.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/libiec61850/f=
iles/CVE-2026-19108.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/libiec61850/f=
iles/CVE-2026-19206-1.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/libiec61850/f=
iles/CVE-2026-19206-2.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/libiec61850/f=
iles/CVE-2026-19206-3.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/miniupnpd/fil=
es/CVE-2026-5720.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-10098-1.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-10098-2.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-10512.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-55958.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-6091-1.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-6091-2.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-6091-3.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-6092.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-6094-1.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-6094-2.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-6094-3.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-6094-4.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-6094-5.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-6291.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-6325.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-6412-1.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-6412-2.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-6450-1.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-6450-2.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-6731-1.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-6731-2.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2026-7531.patch<br>
=C2=A0rename meta-networking/recipes-daemons/proftpd/{<a href=3D"http://pro=
ftpd_1.3.9c.bb" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.9c.bb</a> =
=3D&gt; <a href=3D"http://proftpd_1.3.9d.bb" rel=3D"noreferrer" target=3D"_=
blank">proftpd_1.3.9d.bb</a>} (99%)<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/opcua/open62541/=
CVE-2026-11946.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/tinyproxy/tinyprox=
y/CVE-2026-31842.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/tinyproxy/tinyprox=
y/CVE-2026-54387.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/tinyproxy/tinyprox=
y/CVE-2026-55202.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-32665.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-32792.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-33278.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-40622.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-41292.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-42534.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-42923.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-42944-1.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-42944-2.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-42955.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-42959.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-42960.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-44390.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-44608.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-44621.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-44687.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-46582.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-50045.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-50046.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-50243.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-50248.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-50251.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-50252.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-52863.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-54478.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-55708.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-55717.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-55973.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-55990.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-55991.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-56416.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-56444.patch<br>
=C2=A0rename meta-oe/recipes-connectivity/asyncmqtt/{<a href=3D"http://asyn=
cmqtt_10.3.0.bb" rel=3D"noreferrer" target=3D"_blank">asyncmqtt_10.3.0.bb</=
a> =3D&gt; <a href=3D"http://asyncmqtt_10.3.1.bb" rel=3D"noreferrer" target=
=3D"_blank">asyncmqtt_10.3.1.bb</a>} (87%)<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2=
026-58374-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2=
026-58374-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/CVE-202=
6-53689.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/CVE-202=
6-57918.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-41608.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-45112.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-48145.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-48586-01.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-48586-02.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-55969.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-55970.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-58662.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-=
71225.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-=
71226-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-=
71226-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-=
71226-3.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-=
71227.patch<br>
=C2=A0rename meta-oe/recipes-dbs/postgresql/{<a href=3D"http://postgresql_1=
7.10.bb" rel=3D"noreferrer" target=3D"_blank">postgresql_17.10.bb</a> =3D&g=
t; <a href=3D"http://postgresql_17.11.bb" rel=3D"noreferrer" target=3D"_bla=
nk">postgresql_17.11.bb</a>} (87%)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/editorconfig/editorconfig=
-core-c/CVE-2026-40489.patch<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.5.9.bb" =
rel=3D"noreferrer" target=3D"_blank">php_8.5.9.bb</a> =3D&gt; <a href=3D"ht=
tp://php_8.5.10.bb" rel=3D"noreferrer" target=3D"_blank">php_8.5.10.bb</a>}=
 (99%)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/0=
004-Allow-build-with-CMake-4.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/0=
005-Do-not-add-install-rpath-to-shared-libraries.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libyang/libyang/CVE-2026-=
41401.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-=
19654-regression.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2026-=
19654.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2=
026-73066.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2=
026-73067-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2=
026-73067-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-5845=
9-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-5845=
9-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-5845=
9-3.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/dool/dool/CVE-2026-56651.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/dool/dool/CVE-2026-56652.p=
atch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026=
-50031-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026=
-50031-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
40254-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
40254-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
55191.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
55192.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
55193.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
55194.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
55564.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
55648.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
63633.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
63652.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
64620.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
64621.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
66401.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
67288.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17572.=
patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17573.=
patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17574.=
patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19025.=
patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/lcms/lcms/CVE-2026-42798.p=
atch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/0001-pyproject-lower-setuptools-requirement.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_5.2.16.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.2.=
16.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.17.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-django_5.2.17.bb</a>} (42%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-zeroco=
nf/CVE-2026-47180.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-zeroco=
nf/CVE-2026-47183.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-zeroco=
nf/CVE-2026-47184.patch<br>
<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130034): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130034" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130034</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121257153/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121257153/1997914</a><br>
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

--0000000000009b0192065bdd7c47--

