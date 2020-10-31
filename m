Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.5612.1604115798847848878
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2020 20:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gN13c0l8;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id f21so3953855plr.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2020 20:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=ebjmz2oyEd5GFVN2yEz8Zz67D1cWoKf2zPnenHOKC2U=;
        b=gN13c0l8y2pFqzoouXeDPk0ZTbc1FvA8K7Ac82n7Iwck8j6/b2aoHcOwGOhxGAENyg
         yv4KvF3IBljR9o5x4qyFMTdIHW5B0I3WA2JMbtDeI+Nm55QQzZ0/anhz2xZpHkPr9kT1
         /FwOuX+7Hb1jCgWA3yif3qQDbKMKiSvhXFhTAo9s2P3+/QQ+vig60ARSRbjI7OGul7HA
         5Z3C+K28Jy9qQp0kbEykvOCAG8UtgpYwNLWrcGCs0xiRijLWgS83eQoV+hZyKebKB1ML
         EI9Zp2Pzi/TvuRZpnUW6pvqPpJ6NcP/B0OCo1nmtMbY42Bpdy/chpDm5iszUGdUTFOs1
         /yWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=ebjmz2oyEd5GFVN2yEz8Zz67D1cWoKf2zPnenHOKC2U=;
        b=dGHx/dRHo0DKJA/ALsKvCprZbXQ9JD9cQZy8PmiUZNpuJBn0o0JIfvT3OXCuNwrGp5
         7aDlHp5uMTHtiJkYVQ+ABqsjnST5aN6Gvn/jeFr5Q7bgEt4RA9hXTmCkRbzg1CDpZ+zy
         9N7Ec39sRxB2SxhwpNqKO9T4NP6MFRC4gCwqsnuP4FYhh1Al6PjjCv+0CB+pHrkrzpJ+
         xUce/QLC6MpuNQQh6pG+pY3z9JmIjjRz7TTIxq2x0RSlaCwbbPJ9g25YTIPfNo+f6Az7
         zs93MoMDoXJzg/qNbFpwhgTCDVJZU/xP8pTHZi0nUfw3m7jEEuXu97F8D5j4hjlflcpP
         DV0Q==
X-Gm-Message-State: AOAM533Nukew3XGp/RDajd1KK2iENWFy7M7Guwp5TSJbz3wXPKmKvrq4
	0JLYILBypSzw+TiyP2tmOL4=
X-Google-Smtp-Source: ABdhPJzJFHRPbeG2EVJZfA1WWCW6fkjeW5Qaef1YjYHvDkOu/SHrffTyWf4DYtHy6+nwDgB0sMAR8A==
X-Received: by 2002:a17:90a:f293:: with SMTP id fs19mr6470243pjb.41.1604115798350;
        Fri, 30 Oct 2020 20:43:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::221d? ([2601:646:9200:4e0::221d])
        by smtp.gmail.com with ESMTPSA id v3sm4745650pju.38.2020.10.30.20.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2020 20:43:17 -0700 (PDT)
Subject: Re: [oe] CPE update for polkit
To: saloni <saloni.jain@kpit.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: "Nisha.parakkat@kpit.com" <Nisha.parakkat@kpit.com>,
 Anuj Chougule <Anuj.Chougule@kpit.com>, Akash Hadke <Akash.Hadke@kpit.com>,
 Aditya Tayade <Aditya.Tayade@kpit.com>, Nilesh Pawar <Nilesh.Pawar@kpit.com>
References: <BM1PR01MB401942C1F999143BBD303E4E87150@BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM>
From: "Khem Raj" <raj.khem@gmail.com>
X-Pep-Version: 2.0
Organization: HIMVIS LLC
Message-ID: <57711827-0ce0-e6ef-28d5-13ba1eba7afd@gmail.com>
Date: Fri, 30 Oct 2020 20:43:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <BM1PR01MB401942C1F999143BBD303E4E87150@BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM>
X-Groupsio-MsgNum: 87748
Content-Type: multipart/mixed;
 boundary="------------D0C74C65D660AE143B29C71F"
Content-Language: en-US

--------------D0C74C65D660AE143B29C71F
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 10/30/20 12:45 PM, saloni wrote:
> Hello,
>=20
> I would like to make some restrictions to polkit CVE-2013-4288
> https://nvd.nist.gov/vuln/detail/CVE-2013-4288
>=20
> The changes for the said CVE were fixed in Source-Version: 0.112-1 and
> are now merged in the reported distributions on stable releases.
> Please find the reference to the links and tar file attesting the same:
>=20
> http://snapshot.debian.org/archive/debian-security/20181206T212649Z/pool=
/updates/main/p/policykit-1/policykit-1_0.105-18%2Bdeb9u1.debian.tar.xz
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1002375
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D723717
> https://ubuntu.com/security/notices/USN-1953-1
> https://www.security-database.com/detail.php?alert=3DCVE-2013-4288
> https://vuldb.com/?id.65188
>=20
> The references on above links claims that upgrading to stable releases
> eliminates this vulnerability.
>=20

we are using 0.116 on master and dunfell so we should be good there.

> Regards,=A0
> Saloni Jain
>=20
> This message contains information that may be privileged or confidential
> and is the property of the KPIT Technologies Ltd. It is intended only
> for the person to whom it is addressed. If you are not the intended
> recipient, you are not authorized to read, print, retain copy,
> disseminate, distribute, or use this message or any part thereof. If you
> receive this message in error, please notify the sender immediately and
> delete all copies of this message. KPIT Technologies Ltd. does not
> accept any liability for virus infected mails.
>=20
>=20
>=20
>=20

--------------D0C74C65D660AE143B29C71F
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------D0C74C65D660AE143B29C71F--
