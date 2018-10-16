Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 60706749F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 07:35:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9G7ZLIr029132
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Oct 2018 00:35:21 -0700 (PDT)
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 16 Oct 2018 00:35:20 -0700
To: Khem Raj <raj.khem@gmail.com>, Mark Asselstine
	<mark.asselstine@windriver.com>
References: <1539637881-20308-1-git-send-email-mark.asselstine@windriver.com>
	<CAMKF1sowVnGuDxLyK1mmgyT9B2=HbLv-pxWuW+jsAR1r+8Opnw@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <03c98f69-1127-172e-ac59-bb7450f37c04@windriver.com>
Date: Tue, 16 Oct 2018 15:35:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sowVnGuDxLyK1mmgyT9B2=HbLv-pxWuW+jsAR1r+8Opnw@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] polkit: fixup 'installed but not shipped' error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Oct 2018 07:35:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年10月16日 06:01, Khem Raj wrote:
> may be we can use bitbake variables here and also optimize it a bit if
> possible ?
> too many installs there

It is not the issue of polkit, but gobject-introspection.bbclass in oe-core,
I've sent the fix to oe-core.

Here is my fix:

commit 29b41806fa5679881efd04b0b41ecbf4ddd07d11
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Tue Oct 16 15:31:23 2018 +0800

     gobject-introspection.bbclass: fix gir installed but not shipped in 
any package while multilib enabled

     Since commit [9524330 gobject-introspection: fix multilib install
     file conflicts] applied in oe-core, while multilib enabled, gir
     files will be installed to `${libdir}'.

     Refer above commit, modify gobject-introspection.bbclass to
     split gir to package correctly.

     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

diff --git a/meta/classes/gobject-introspection.bbclass 
b/meta/classes/gobject-introspection.bbclass
index b6160b8..a323c1f 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -40,4 +40,4 @@ FILES_${PN}_append = " ${libdir}/girepository-*/*.typelib"

  # .gir files go to dev package, as they're needed for developing (but 
not for
  # running) things that depends on introspection.
-FILES_${PN}-dev_append = " ${datadir}/gir-*/*.gir"
+FILES_${PN}-dev_append = " ${datadir}/gir-*/*.gir ${libdir}/gir-*/*.gir"

//Hongxu

>> +        mv ${D}${libdir}/gir-1.0 ${D}/usr/share/.
>


