Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.75])
 by mx.groups.io with SMTP id smtpd.web11.6592.1591670525777815189
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 19:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CYTIZce7;
 spf=pass (domain: windriver.com, ip: 40.107.75.75, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ObH5u3BVhLgo9V+YsmymFqDhBIo0y9ZjzPlb7tARiOdl9ku3ANWK3umEZzs1xDqUbn/q3e4vJmZzmr5NiS5PrMNbvyup3CC///gFZuAVXO5pqFxvjwn9VXM8c9GPxMUQvdz1ViAkKKixsu8YZTBZxMflWf+Pxe7tlvodyNCuiQ6NzMF+PU8ykRBpIJPY8yLRX+Fg04ICj4G+OmAGjMOZizEP/7gBveNom8dWAfTuyG2x24xMKM5EfcYH2j1UplDJvNr/d8NfFvoLjnPYaL8GqjzZSA2b+j5oP78YeY9j5gK80tFJqCNVwXrFO0SAYRYCvx6tMWQDVldEP7+ceJWiTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3MJsRAryaDB1oMebM1Vannj9UmUQeLX0+9dR5Di1mg=;
 b=fovJ+fis8jrgYYUSotH61ltISfG8CoqP3PaBvR/MqJR5cCZcAO/qbCtE5qLbLZySkU5tC6wd0CObTz/0eIC0XYNV2v1xxtEVIIExtwYKZDTwepuPqYjPUdRCt2nrIENqY9z8a0cYuoRtRC86WURgS9khUse7OTe0ZcgI+z/SLGCGshOcAgEpviwSr3swuT7n8EJeGDf6Dtqgnokcda/eo6K3sZ4+ljaxubXtvUDq3w+K89zjQoLd3WmEJWoquwYi7iaeitZ2gT8e2uMsQmOFhsBwc8v0e+sf7fij7ZKMGn0k27/y2SjTpu+hl0cosjZfzDgHmMZlEMc+jdSyK3MqsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3MJsRAryaDB1oMebM1Vannj9UmUQeLX0+9dR5Di1mg=;
 b=CYTIZce7OQ+zLlNoNgiAYEwQG/DVxpwxx9lmSPmUDhtgRpiSYU8pqPzaCgGuiDtRTVaKhvZvk+UfdQ1h45rimv9CtJDzqAENyAW/OL0zjFS5weQ0fVwadJHa6Np44C8zNCtqnpxvm6KBiJxYUcNeY69TwPaZdGPcFBFnyS5oUe4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3781.namprd11.prod.outlook.com (2603:10b6:a03:b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 9 Jun
 2020 02:42:03 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::ddb1:52c7:c1f9:a70c]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::ddb1:52c7:c1f9:a70c%3]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 02:42:03 +0000
Subject: Re: [oe][meta-oe][PATCH] multipath-tools: fix do_compile failure due to json-c upgrade
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <1616BD0C096C2760.7047@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <9f0b55ce-3668-2920-47a8-1f5c67581512@windriver.com>
Date: Tue, 9 Jun 2020 10:45:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <1616BD0C096C2760.7047@lists.openembedded.org>
X-ClientProxiedBy: BY5PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::20) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by BY5PR03CA0010.namprd03.prod.outlook.com (2603:10b6:a03:1e0::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3066.18 via Frontend Transport; Tue, 9 Jun 2020 02:42:01 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 421cf1ae-6ff2-433b-7274-08d80c1eb0cc
X-MS-TrafficTypeDiagnostic: BYAPR11MB3781:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB37812C6DBEA3AA85C8B572AAED820@BYAPR11MB3781.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-Forefront-PRVS: 042957ACD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H+Wf6Iex87j45biHjIcX2luNnWGEzNcLA2dXmhH9PVeQc4Z0uLAeNvEVDcYw39JLXzVohK7t3P0x5TdDwG+9xkblzlTpiunvA+UAAffz1ry8kGEc5GVqvCmiD2DBvjQJw1cgPtUZTfhvtD+nltHryeXFTuqV9FnRrMdfrnH2rzWqCkpgg18Ny0reFqSyg7a1mZfclxJqHeIQBzynf4LFt3ORO5j8zCpXNSDE5fLKulUMwVjW+oAudEm1KuUBXKcb3u6c1YNzseyYgem6/HrA5oar5nbY5PZkNGzpYnasJ6ou9c0j5F8rTfHJ2qs2Kbzpo261pgVKdgd7+5RiqgrggXBqgYV76wp3GjoAFHGyBbn8p6HGX2lWJ9z4mjqQpol+SalktGH5dtION3f+Rwo3QOnpNpBgDIJLvLmUOhjTnJS71Y/s5qalQ27+ts/da7hrn25SfoxzCE9dRtRvlihzvwQw57hYMX7Zl0TbBoaSMlQ+hA5Xjk2pirO+Un+hUWCWqcjZyyFwZKd4NejYj2Z65A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(346002)(376002)(366004)(136003)(5660300002)(186003)(2616005)(83380400001)(66946007)(66556008)(66476007)(956004)(966005)(6916009)(166002)(36756003)(6706004)(16526019)(33964004)(478600001)(52116002)(26005)(8936002)(31686004)(16576012)(86362001)(19627235002)(6486002)(2906002)(31696002)(8676002)(53546011)(316002)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	x5u34XwxMpe12ZiUOsJTc8BWNrf2kRLLRH8APyD6CgKNcFWiO4ifZdfv7330OgdPoYD4WxSOl0gAZhzXd9CUKJcnB0G2ZrnWdVQDKXExT96m0y1FOTMiL4Ue/LtBcUHNZx7Datk0xlZRmCaj7pfRXUkhVcK1qpdZleXXk3hK7brO55FfWibb5vBfmAV43Po43GCTmEem4nmhx1NOg0ctu5g6ACCXa1i7WldqnUy3bIgjxzmFspkima+xCucEEeNbyoha7yTNiNkf8Dsnd2mEBe2ex3gggpfXUiIG05BfJa06raFjKc10+hdw8iqRG8grQrNa/J2x/sBLwzwW+S9He8aAMVhbMCQC9caaEeDs0iCo5JH1m8OpUfW4P2hKGv09jldNRgVY0VcVqJaw3hOkLsNV3ohiW9CNtW33AfslxKyoZl335uqbzqjj8nh1/KTKEyhul3A9P7MT8yeAAPfgb/aShpZ4k2GqDatmU9NlHA4=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421cf1ae-6ff2-433b-7274-08d80c1eb0cc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2020 02:42:03.0054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtFZ4JNyoWYALG9X0GCMxpBHx3ufwwYlPwN8ydUt7PtMowvWcdRQ/EbAjeQ1Elg/TUMRdkeKw8J/9mreVIz05A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3781
Content-Type: multipart/alternative;
 boundary="------------85FA1774A96F2D25C566077C"

--------------85FA1774A96F2D25C566077C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Just noticed Khem has sent a similar patch. Ignore this one please.

On 06/09/2020 09:48 AM, Chen Qi wrote:
> The new json-c does not define TRUE, so we should use 1 to avoid
> do_compile failure.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   ...01-libdmmp_private.h-Do-not-use-TRUE.patch | 31 +++++++++++++++++++
>   .../multipath-tools/multipath-tools_0.8.4.bb  |  1 +
>   2 files changed, 32 insertions(+)
>   create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-libdmmp_private.h-Do-not-use-TRUE.patch
>
> diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-libdmmp_private.h-Do-not-use-TRUE.patch b/meta-oe/recipes-support/multipath-tools/files/0001-libdmmp_private.h-Do-not-use-TRUE.patch
> new file mode 100644
> index 000000000..a78bfd2c6
> --- /dev/null
> +++ b/meta-oe/recipes-support/multipath-tools/files/0001-libdmmp_private.h-Do-not-use-TRUE.patch
> @@ -0,0 +1,31 @@
> +From cdee4a7e9f8aa880eb4f381aa4325c1ae42951f8 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Mon, 8 Jun 2020 18:43:10 -0700
> +Subject: [PATCH] libdmmp_private.h: Do not use TRUE
> +
> +As json-c has been upgraded and TRUE is not defined any more, we should
> +avoid using it and use 1 instead.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + libdmmp/libdmmp_private.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libdmmp/libdmmp_private.h b/libdmmp/libdmmp_private.h
> +index ac85b63f..4378962b 100644
> +--- a/libdmmp/libdmmp_private.h
> ++++ b/libdmmp/libdmmp_private.h
> +@@ -82,7 +82,7 @@ static out_type func_name(struct dmmp_context *ctx, const char *var_name) { \
> + do { \
> + 	json_type j_type = json_type_null; \
> + 	json_object *j_obj_tmp = NULL; \
> +-	if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) != TRUE) { \
> ++	if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) != 1) { \
> + 		_error(ctx, "Invalid JSON output from multipathd IPC: " \
> + 		       "key '%s' not found", key); \
> + 		rc = DMMP_ERR_IPC_ERROR; \
> +--
> +2.21.0
> +
> diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
> index af34a4b39..5018f51d2 100644
> --- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
> +++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
> @@ -45,6 +45,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
>              file://0031-Always-use-devmapper-for-kpartx.patch \
>              file://0001-fix-bug-of-do_compile-and-do_install.patch \
>              file://0001-add-explicit-dependency-on-libraries.patch \
> +           file://0001-libdmmp_private.h-Do-not-use-TRUE.patch \
>              "
>   
>   LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
>
>
> 



--------------85FA1774A96F2D25C566077C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Just noticed Khem has sent a similar
      patch. Ignore this one please.<br>
      <br>
      On 06/09/2020 09:48 AM, Chen Qi wrote:<br>
    </div>
    <blockquote cite="mid:1616BD0C096C2760.7047@lists.openembedded.org" type="cite">
      <pre wrap="">The new json-c does not define TRUE, so we should use 1 to avoid
do_compile failure.

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
 ...01-libdmmp_private.h-Do-not-use-TRUE.patch | 31 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 .../multipath-tools/multipath-tools_0.8.4.bb  |  1 &#43;
 2 files changed, 32 insertions(&#43;)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-libdmmp_private.h-Do-not-use-TRUE.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-libdmmp_private.h-Do-not-use-TRUE.patch b/meta-oe/recipes-support/multipath-tools/files/0001-libdmmp_private.h-Do-not-use-TRUE.patch
new file mode 100644
index 000000000..a78bfd2c6
--- /dev/null
&#43;&#43;&#43; b/meta-oe/recipes-support/multipath-tools/files/0001-libdmmp_private.h-Do-not-use-TRUE.patch
@@ -0,0 &#43;1,31 @@
&#43;From cdee4a7e9f8aa880eb4f381aa4325c1ae42951f8 Mon Sep 17 00:00:00 2001
&#43;From: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
&#43;Date: Mon, 8 Jun 2020 18:43:10 -0700
&#43;Subject: [PATCH] libdmmp_private.h: Do not use TRUE
&#43;
&#43;As json-c has been upgraded and TRUE is not defined any more, we should
&#43;avoid using it and use 1 instead.
&#43;
&#43;Upstream-Status: Pending
&#43;
&#43;Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
&#43;---
&#43; libdmmp/libdmmp_private.h | 2 &#43;-
&#43; 1 file changed, 1 insertion(&#43;), 1 deletion(-)
&#43;
&#43;diff --git a/libdmmp/libdmmp_private.h b/libdmmp/libdmmp_private.h
&#43;index ac85b63f..4378962b 100644
&#43;--- a/libdmmp/libdmmp_private.h
&#43;&#43;&#43;&#43; b/libdmmp/libdmmp_private.h
&#43;@@ -82,7 &#43;82,7 @@ static out_type func_name(struct dmmp_context *ctx, const char *var_name) { \
&#43; do { \
&#43; 	json_type j_type = json_type_null; \
&#43; 	json_object *j_obj_tmp = NULL; \
&#43;-	if (json_object_object_get_ex(j_obj, key, &amp;j_obj_tmp) != TRUE) { \
&#43;&#43;	if (json_object_object_get_ex(j_obj, key, &amp;j_obj_tmp) != 1) { \
&#43; 		_error(ctx, &quot;Invalid JSON output from multipathd IPC: &quot; \
&#43; 		       &quot;key '%s' not found&quot;, key); \
&#43; 		rc = DMMP_ERR_IPC_ERROR; \
&#43;-- 
&#43;2.21.0
&#43;
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index af34a4b39..5018f51d2 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
&#43;&#43;&#43; b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -45,6 &#43;45,7 @@ SRC_URI = &quot;git://git.opensvc.com/multipath-tools/.git;protocol=http \
            <a class="moz-txt-link-freetext" href="file://0031-Always-use-devmapper-for-kpartx.patch">file://0031-Always-use-devmapper-for-kpartx.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-fix-bug-of-do_compile-and-do_install.patch">file://0001-fix-bug-of-do_compile-and-do_install.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-add-explicit-dependency-on-libraries.patch">file://0001-add-explicit-dependency-on-libraries.patch</a> \
&#43;           <a class="moz-txt-link-freetext" href="file://0001-libdmmp_private.h-Do-not-use-TRUE.patch">file://0001-libdmmp_private.h-Do-not-use-TRUE.patch</a> \
            &quot;
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2">&quot;file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2&quot;</a>
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------85FA1774A96F2D25C566077C--
