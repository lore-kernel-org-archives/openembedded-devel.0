Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.140.1611596724512434117
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 09:45:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Io1lIkZh;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10PHjMva114670;
	Mon, 25 Jan 2021 11:45:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1611596723;
	bh=Ds1X8NcOp0ewCyaPqmayc1+eGY4jdF8FpCEG8XeIUto=;
	h=To:CC:From:Subject:Date;
	b=Io1lIkZhe5lUvf2VmlCdD45s1AlBSQNYWqgC3fkV7SD2I+dsPE9JJFk81TQDY9eZv
	 l8/gO79pa/3X6dxYvs9RNv86EwNbohtgmkfWsPqtv8LywOzXklUS5U5uIiR/C0HEOL
	 Dki1JTsXtW7GNlU4Qw7wvsNpYi57VZ+yTtx9XIUo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10PHjMHB102155
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Jan 2021 11:45:22 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 25
 Jan 2021 11:45:22 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 25 Jan 2021 11:45:22 -0600
Received: from [10.250.39.0] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10PHjMaX085731;
	Mon, 25 Jan 2021 11:45:22 -0600
To: <akuster808@gmail.com>
CC: <Openembedded-issues@lists.openembedded.org>,
        <openembedded-devel@lists.openembedded.org>
From: "Dan Murphy" <dmurphy@ti.com>
Subject: [RFC] Issues with mariadb-10.4.17 and aarch64
Message-ID: <6cde28bf-c69d-1d42-785e-dc228202e357@ti.com>
Date: Mon, 25 Jan 2021 11:45:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="------------7996274BDDC50D62150A0185"
Content-Language: en-US

--------------7996274BDDC50D62150A0185
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hello

I was wondering if there has been any reports of the mariadb update on 
the dunfell branch causing issues with 64bit compilers when the 'pam' is 
set for DISTRO_FEATURES

There does not seem to be a compilation issue but more of an 
installation issue in which the lib/security directory is not being created.

We are seeing issues in our arago distro with the following errors

mv: cannot stat '/OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/lib/security': No such file or directory
*09:38:06* WARNING: /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/temp/run.do_install.5379:1 exit 1 from 'mv /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/lib/security /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image//usr/lib'



--------------7996274BDDC50D62150A0185
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello</p>
    <p>I was wondering if there has been any reports of the mariadb
      update on the dunfell branch causing issues with 64bit compilers
      when the 'pam' is set for DISTRO_FEATURES<br>
    </p>
    <p>There does not seem to be a compilation issue but more of an
      installation issue in which the lib/security directory is not
      being created.<br>
    </p>
    <p>We are seeing issues in our arago distro with the following
      errors</p>
    <pre style="box-sizing: border-box; white-space: pre-wrap; overflow-wrap: break-word; margin: 0px; color: rgb(51, 51, 51); font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span class="timestamp" style="box-sizing: border-box;"> </span>mv: cannot stat '/OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/lib/security': No such file or directory
<span class="timestamp" style="box-sizing: border-box;"><b style="box-sizing: border-box;">09:38:06</b> </span>WARNING: /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/temp/run.do_install.5379:1 exit 1 from 'mv /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image/lib/security /OE/arago-dunfell-next-build/build-AARCH64_1/arago-tmp-external-arm-glibc/work/aarch64-linux/mariadb/10.4.17-r0/image//usr/lib'


</pre>
  </body>
</html>

--------------7996274BDDC50D62150A0185--
