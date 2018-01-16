Return-Path: <jaragunde@igalia.com>
X-Greylist: delayed 2638 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 Jan 2018 13:06:24 UTC
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id AC45678548
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jan 2018 13:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=pkNN5Y5pyph87PXqBF5/ekBtoqofR4Oo1sWQmHHRPEQ=; 
	b=JUQTUp6+frQ31fcLFkOr881Zklx7jztvLTKAIO124L2BtrElBhPbjP42rx93AsaAFW1h0GrwS01VHEDXhjt5bcHKAlhslZzcvq7jXyN0/j/IiOIiRhgsCK90HEVu+3Gyck5BP6Hj9NZ86iLqEVO+mNNP4f91MkrW0qfZbBFqO9V5NUfRNH91fXhc7HoOcgEEX8nf2fhRBarOf1rvFeIxzPUOyroj+Raj6Icr+GQhsLd8Kib2c8FLdPd63N9fKtexsHtoZGQlL0xnsbET5SK2WvSAaO5G9LQYl/MiSQB7Gpe6jER/+dgSejHwgcrQ42Hzs2SPoKxnqeJiPsVSwQ17TQ==;
Received: from [192.168.10.193] by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1ebQG3-00061x-GE; Tue, 16 Jan 2018 13:22:27 +0100
To: openembedded-devel@lists.openembedded.org
References: <CY1PR02MB1287081D0CCB26032B3B05F3B0EB0@CY1PR02MB1287.namprd02.prod.outlook.com>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <4b27f51d-6d50-46d4-f814-c003f9be5613@igalia.com>
Date: Tue, 16 Jan 2018 13:22:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CY1PR02MB1287081D0CCB26032B3B05F3B0EB0@CY1PR02MB1287.namprd02.prod.outlook.com>
Subject: Re: [meta-browser] Running chromium as root
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
X-List-Received-Date: Tue, 16 Jan 2018 13:06:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi!

On 15/01/18 23:14, Bhargava Sreekantappa Gayathri wrote:
> Hello,
> 
> Has anyone has been able to run chromium-x11 as root user? Is there a flag or config I can tweak before building chromium?
> 

You should be able to run chromium as root with the runtime flag
`--no-sandbox`. No changes in the build process are needed.

Take into account such a setup is discouraged for security reasons!

Best,
-- 
Jacobo Aragunde
Software Engineer at Igalia

