Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.43])
 by mx.groups.io with SMTP id smtpd.web12.10355.1594602706024571382
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 18:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Nlzv1lnH;
 spf=pass (domain: windriver.com, ip: 40.107.93.43, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLEqadm2+tPV8zQ00VCdhTEm5cAa0leDCD/2XUgEGtW+UABVQyXbMdV6nGajbmsg+Kj7tpyXUcCZNT+OyXbReY4hkdhnJj72k5KSWs31/gUUWniHAFjUv0I/Q5xl/ua9l44A2ZQfhcsOZ9w63jgR9sMGAGarGQl/3iqB4Hxu5KifQpreYDVbIfXUrl+KBDlESn3HAN+yZY37EN5EuzRk2BDuvDEH3PyDnlJfiHUyy/K7lBdajXnxM1Hz7nc4sb+dmAKPx+nd68UKsDLMVLiTbu5skqW5GCGo125JhCIDXIr8pM/9wg+/MbydzbO2YI7vuh1/d94z26AxulJSARZ7pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+6OTq/PSG6+DP3pBpIFPOdwrr3SuG0Ra/QLLaWu5YY=;
 b=KLF7IlNPDN9fU8++JKVnSL9tq/LHmZPjR66M1UoYiH9KX0srD6A1IeJOJM/vDc0Jg2P9sxPG+ytS4fEuq0ximXtpXT00gJJzVJTOs+nI/4yaRs66Pqc9QHGcgP+k6qjmAfGF7YtA6oaJmxtBDl97xqaaTgaO9j7f1b7vKma6DGQnqGMk0uGnioQGVA0ZJ8IeC5b67zIKmzJ1sDH4Y1KiaJKeHO94gbRZoI5rchtcuM3Xiv/nX4E3WdDF7uq6brCzPB54tctaQf5Q85E+s9l5WMnDOzUFW7VQmQjP1ZeVjPZgR/SdJMwVAtJy0zclB3IbpKPkgljVVqBb24qLEZ3BYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+6OTq/PSG6+DP3pBpIFPOdwrr3SuG0Ra/QLLaWu5YY=;
 b=Nlzv1lnH32wZFFCI6eO0uBY+/EZBn3ibKk3j7vBfMC7lUbGHgrsk6YMAG7ExSl+k/6R+3t/1T9ZJh3C4xs03uohe/S+otUmhS8C/pZjw01jj8CtP7sw2tMJS8xyvxixJvE7bgdx8yqn8ao8jR2QAJlPaAOTytHp/6R9Hh/S6iP4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB2912.namprd11.prod.outlook.com (2603:10b6:805:cb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Mon, 13 Jul
 2020 01:11:43 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4%7]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 01:11:42 +0000
Subject: Re: [oe] [meta-oe][PATCH] rsyslog: get alias of syslog back
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
References: <16205920B40F3B3B.7755@lists.openembedded.org>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <0f9d5288-1d7f-547c-8641-c205ff45a203@windriver.com>
Date: Mon, 13 Jul 2020 09:11:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <16205920B40F3B3B.7755@lists.openembedded.org>
X-ClientProxiedBy: HKAPR03CA0003.apcprd03.prod.outlook.com
 (2603:1096:203:c8::8) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HKAPR03CA0003.apcprd03.prod.outlook.com (2603:1096:203:c8::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9 via Frontend Transport; Mon, 13 Jul 2020 01:11:41 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99a2bc12-406e-4778-6524-08d826c9b41a
X-MS-TrafficTypeDiagnostic: SN6PR11MB2912:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB29128BF932B42F84F3317F3F82600@SN6PR11MB2912.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:168;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ca9gkzQ/cZ0K+7KIQrTvTtCvrdRfk9CsuWIRAbKmA7NjTzuJQUG2IEaOH1EspCD61R9FJUK1o1v0GZEh2//PJe/uIM+oFx+ujILGW0QJn3bp05nZ5VEZLC0IS9IKnXAtFGx1NjhyU36OWi6kojousZJo05aVIsaEUc8vL9nRVukxVAV91weFEDqvAR3WYd5NUrT17FP657PYADOl8zaGLIq7dX3JIOUQLEhUSpoG9uvMHXcPMnMPKb50A5SS+ngUgIW0XV1djVjJ8bGQdzL1COdgWnI951h/SKwe+/pcbLPnWdjlL/V8TlZhSt2w5rHEpZHPMxJuHngy1ksI6FCT2PbjPwtHDcKT13YDhboeJDNnrLma9JVwCFzJmk0Qy9vGFKZKbKZzBjz30mhp9aLcSbQhGTfWt0VjcNeTvwbAfn57kcSMYBgsy/dXHcPhONAuDnA0pJwMRozW4O9dYvaL5iNRQbWlKI4vHJBJGoSgsPZbwIAaaiX2cX8hNJHHhf9j/jQLj7R0sbRAgJZa4NQkmQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(366004)(136003)(346002)(39830400003)(376002)(8936002)(478600001)(53546011)(31686004)(8676002)(66556008)(33964004)(66476007)(6666004)(66946007)(36756003)(16576012)(966005)(316002)(16526019)(86362001)(52116002)(83380400001)(166002)(2616005)(6486002)(2906002)(6706004)(26005)(956004)(186003)(31696002)(44832011)(5660300002)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	C8fdnLPqrSrUhCsrKDmCfIQusnXtINQ8U36ncoAReMYZKXGFL6AapawxDfOnj06tE7GmfPl1kPNA8p/gkfaOoCNbUWBOuKwcydL0nCEicde9Y0U9G21hrU75qRh8RrKp4TldYH7VQZTvXr9IfcqSZGfRyNvusi1408hIbV+cwpvbCGo9jJPnhTUBCd2I0R7Z+nkPdztT9NtArQN6bAFy6dxc9sht/ywNWf5Zr82W2Pa/1/NJDsI5TLlm0cFg7kLJPfIOAFuUPnjilqzf7eCdN01ckCHtFWJvqMAtHJwwe18Vcz4uIOEhCdJMxNRbu/7N6ItEISNOax8kAAfqE/8LKj/MLBLCzK5GWVvEEMJWfqr6Ifgdv6ChwTyV5I5K/eOdnF9RbtWt2DSVyoBwdKZE3PVZnMMfkaU8eufMVityEq4NAxSB7m0SMSzms2s9u/YL7ud/9uYLWUZmEe1BpxxANZwFvI4gbicBnEwKwNIFv8s=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a2bc12-406e-4778-6524-08d826c9b41a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2020 01:11:42.7274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHgahuJm3qugeJbQftE+kcRo/tvPg7ZRfKnqW4mB6r0R4IjYS0MKFFk6zCkOV89WGOhtQadtX3RUry/Xutc1hIdZLA3DeU0Jtd8AIr+Jyy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2912
Content-Type: multipart/alternative;
 boundary="------------F391C8CC2A55753C9723FB61"
Content-Language: en-US

--------------F391C8CC2A55753C9723FB61
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Khem

I noticed this patch is on next branch,  but this patch have problem 
with sysV,

I need to send a V2 later.  Please help to revert it.  Thanks and sorry 
for troubling you.

On 7/10/20 5:07 PM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> since upstream rsyslog commit
> https://github.com/rsyslog/rsyslog/pull/4317/commits/7a671da74f78047b3fd0eb65203f045de28cec0f
> , Alias=syslog.service is removed from service file, which will make
> systemctl restart syslog fail since Unit syslog.service not found when
> we set rsyslog to default syslog.
>
> And upstream have change the solution about pull 4317, so during next
> upgrade, we need to add our own rsyslog.service, refer
> https://github.com/rgerhards/rsyslog/commit/83d5710f074b34263322cd53fa1112aafd25b985
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
> index ff6699509..263a86e5c 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
> @@ -152,6 +152,9 @@ do_install_append() {
>           install -d 0755 ${D}${sysconfdir}/rsyslog.d
>           echo '$ModLoad mmjsonparse' >> ${D}${sysconfdir}/rsyslog.d/mmjsonparse.conf
>       fi
> +
> +    sed -i -e "s#;Requires=syslog.socket#Requires=syslog.socket#g" ${D}${systemd_system_unitdir}/rsyslog.service
> +    sed -i -e "s#;Alias=syslog.service#Alias=syslog.service#g" ${D}${systemd_system_unitdir}/rsyslog.service
>   }
>   
>   FILES_${PN} += "${bindir}"
>
> 

--------------F391C8CC2A55753C9723FB61
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi, Khem</p>
    <p>I noticed this patch is on next branch,&nbsp; but this patch have
      problem with sysV, <br>
    </p>
    <p>I need to send a V2 later.&nbsp; Please help to revert it.&nbsp; Thanks and
      sorry for troubling you.</p>
    <div class="moz-cite-prefix">On 7/10/20 5:07 PM, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16205920B40F3B3B.7755@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

since upstream rsyslog commit
<a class="moz-txt-link-freetext" href="https://github.com/rsyslog/rsyslog/pull/4317/commits/7a671da74f78047b3fd0eb65203f045de28cec0f">https://github.com/rsyslog/rsyslog/pull/4317/commits/7a671da74f78047b3fd0eb65203f045de28cec0f</a>
, Alias=syslog.service is removed from service file, which will make
systemctl restart syslog fail since Unit syslog.service not found when
we set rsyslog to default syslog.

And upstream have change the solution about pull 4317, so during next
upgrade, we need to add our own rsyslog.service, refer
<a class="moz-txt-link-freetext" href="https://github.com/rgerhards/rsyslog/commit/83d5710f074b34263322cd53fa1112aafd25b985">https://github.com/rgerhards/rsyslog/commit/83d5710f074b34263322cd53fa1112aafd25b985</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb | 3 &#43;&#43;&#43;
 1 file changed, 3 insertions(&#43;)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
index ff6699509..263a86e5c 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
&#43;&#43;&#43; b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
@@ -152,6 &#43;152,9 @@ do_install_append() {
         install -d 0755 ${D}${sysconfdir}/rsyslog.d
         echo '$ModLoad mmjsonparse' &gt;&gt; ${D}${sysconfdir}/rsyslog.d/mmjsonparse.conf
     fi
&#43;
&#43;    sed -i -e &quot;s#;Requires=syslog.socket#Requires=syslog.socket#g&quot; ${D}${systemd_system_unitdir}/rsyslog.service
&#43;    sed -i -e &quot;s#;Alias=syslog.service#Alias=syslog.service#g&quot; ${D}${systemd_system_unitdir}/rsyslog.service
 }
 
 FILES_${PN} &#43;= &quot;${bindir}&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F391C8CC2A55753C9723FB61--
