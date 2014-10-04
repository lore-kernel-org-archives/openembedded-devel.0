Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo01.lge.com (lgeamrelo01.lge.com [156.147.1.125])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB9F6017E
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Oct 2014 17:48:41 +0000 (UTC)
Received: from unknown (HELO lgekrhqms23b.lge.com) (10.185.110.101)
	by 156.147.1.125 with ESMTP; 5 Oct 2014 02:48:41 +0900
X-Original-SENDERIP: 10.185.110.101
X-Original-MAILFROM: changhyeok.bae@lge.com
X-AuditID: 9c93017c-b7fe56d000000ef0-bd-542ec0d553c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mQk+lbi/m4EWEzGp7nj0KpZug4zd56v/1+t9GgL/W9w=;
	b=0+rqKWzjHP+srOWHvAVXYtTCt0S6C70n605CeR3bpyud62WnDeP/TWf9ffcGHdIORP
	kR2oQ8amMRBKQcTcVCXN6N9E7UokmyyCmqtKzVej9HxxUqVv76Fp4qtE//45gBTSh5Uh
	/DgAsZGq+pBAsZjfs3sRkKHlY4cn5ReItp+PqIEfLsBHDfPc/XOgtVzd6DsEJjGVJUD3
	RwMkAzcNevjOEEFqtWjzUJernKYRa4gf13xmMfbNW+GG8z4P9qk0ZBDMy7NLc+ekdV0a
	8I1L5ZakRS7mUK+RCS+oQD0MgthN9cUX1pBEPTaNiuT0sX4Gu2O+0EG3NxaiqVCS2FyV
	Cefw==
X-Received: by 10.194.119.193 with SMTP id kw1mr8533862wjb.82.1412350165192;
	Fri, 03 Oct 2014 08:29:25 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
References: <1411952961-5092-1-git-send-email-changhyeok.bae@lge.com>
	<20141001152158.GE25706@jama>
	<00cd01cfdef8$c86aeca0$5940c5e0$@lge.com>
In-Reply-To: <00cd01cfdef8$c86aeca0$5940c5e0$@lge.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnk+JIrShJLcpLzFFi42Lxqg3S1b1+QC/E4NVFC4uJu+ocGD263l5h
	CmCM4rJJSc3JLEst0rdL4MqYev8Lc8FczYp528+yNjC+U+pi5OSQEDCRuHfnGTuELSZx4d56
	ti5GLg4hge2MEo8ntLNCOBMYJWZu/MwM4rAIbGOVaJlxgw2ipVri/pbnYLaQgKrE9IXrmCA6
	9jJJHDn7hgkkwSagLXHt9wqoBluJ9iN/wOIsAioSL+d3A9kcHCJANXOPx4OEmQV0Jd6/38gI
	YgsLOEqsbLgLdh6vgKbEtP4mRoj5ExklvpyewAqREJQ4OfMJC8gcZoESiaXPPCFMaYnl/zhA
	KjgFzCRu7d8EtlUUaOuVCW/ZJzCKzkLSPAuheRZC8yywe7Qkbvx7yYQhrC2xbOFrZgjbVmLd
	uvcsELaaxKZnp1kWMHKsYhT2cXd19A1y9fE0MNTLSU/VS87P3cQIjLQ5kxlrdjD2nrY+xCjA
	wajEw3txrl6IEGtiWXFl7iFGSQ4mJVFe7m1AIb6k/JTKjMTijPii0pzU4kOMKkAbHm1YfYFR
	iiUvPy9VSYR3wUqgOt6UxMqq1KJ8mDJpDhYlcV6fTUIhQgLpiSWp2ampBalFMFkmDvZDjDIc
	HEoSvDP3A3ULFqWmp1akZeaUIKvhPMQowcEDtGE/SA1vcUFibnFmOkT+FKMxx6vD73qZOJ59
	AJJCYMdIifNuAykVACnNKM2DmwZLp5cYZaWEeRkZGBiEeIDOyc0sQZV/xSgODA1h3qMgU3gy
	80rg9r0COoUJ6JR39rogp5QkIqSkGhgrrG5a33T4W/p17sUt6RsdGdSniB59f6RKN37Oc8PI
	2ef+f4xYWSD0WVN3zsqWk81ODf07Xy7YVP269Mn0tz9EPv36f7MsRtxUcsaeeQvVu314kySy
	5rxp511Txv9TYFFGcNqb24f650fbrlxwftr3GY85TSZrGzILBmRoajy6tTAwafUx7zlsSizF
	GYmGWsxFxYkAG1dud6IDAAA=
X-Priority: 3 (Normal)
Auto-Submitted: auto-generated
From: "=?EUC-KR?B?uejDosf1?=" <changhyeok.bae@lge.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <OF66E26881.4ADB6BB5-ON49257D67.0061D701-49257D67.0061D701@lge.com>
Date: Sun, 5 Oct 2014 02:48:40 +0900
X-MIMETrack: Itemize by Notes Server on LGEKRHQMS23B/LGE/LG Group(Release
	8.5.3FP3HF583 | August 9, 2013) at 2014/10/05 02:48:35,
	Serialize by Router on LGEKRHQMS23B/LGE/LG Group(Release 8.5.3FP3HF583
	| August 9, 2013) at 2014/10/05 02:48:40,
	Serialize complete at 2014/10/05 02:48:40
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re : Re: [meta-oe][PATCH] gdal: update to version 1.11.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Oct 2014 17:48:49 -0000
Content-Type: text/plain; charset="utf-8"


