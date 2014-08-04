Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo02.lge.com (lgeamrelo02.lge.com [156.147.1.126])
	by mail.openembedded.org (Postfix) with ESMTP id 8306262252
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Aug 2014 04:46:35 +0000 (UTC)
Received: from unknown (HELO CHBae0915) (10.177.232.191)
	by 156.147.1.126 with ESMTP; 4 Aug 2014 13:46:27 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: "Changhyeok Bae" <changhyeok.bae@lge.com>
To: <openembedded-devel@lists.openembedded.org>
References: <017701cfaf7e$77e1a390$67a4eab0$@lge.com>
	<20140804030800.GB18172@haswell>
In-Reply-To: <20140804030800.GB18172@haswell>
Date: Mon, 4 Aug 2014 13:46:38 +0900
Message-ID: <01b401cfaf9f$14258da0$3c70a8e0$@lge.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQIcJC1x4u0yzrOUzXfIgpc/R8QnLAFOkj8fmxyAtpA=
Subject: Re: How to apply "-Wl,--build-id" in all recipes?
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
X-List-Received-Date: Mon, 04 Aug 2014 04:46:40 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: ko

As I said, I applied the variable in local.conf.
The LDFLAGS env. variable is included '-Wl,--build-id'.
However, the variable is not applied at the linking time.

Thanks

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Khem
Raj
Sent: Monday, August 04, 2014 12:08 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] How to apply "-Wl,--build-id" in all recipes?

On 14-08-04 09:53:12, Changhyeok Bae wrote:
> Hi
> 
> I would like to apply "-Wl,--build-id" in all recipes option when I 
> build a image.
> I tried to write TARGET_LDFLAGS += "-Wl,--build-d" and BUILD_LDFLAGS 
> += "-Wl,--build-id" in local.conf.
> But it's not applied.
> 
> Do you have any idea?

Did you do it in local.conf or some other global config data files ?
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel


