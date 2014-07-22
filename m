Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id E14DB705E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 13:19:06 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id y20so8192330ier.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 06:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=UTRVSzEB7BtJahxIrNWNG+0wG2wYxHwDKJ+tqmjfgzM=;
	b=jGEEN7sQK82ap/p4BSHj45/54NJ2HW1ZIZ+FYranvvC+jIFCfnNdI2uojTvRXEdxvk
	KVq3Iux0gFmXxxDwA3MjecKsagMup2vdruFDITbn2rc1ZiX+OwA2jyoihyBmoAkUeEik
	3uN9rgcVqxWRr179ZnyhLOizl6pR/nag2NK3QGS1Y6dhaa8qEZ9OGUMzxabXUQoXNI0/
	PsI8dgDo7Su5hT+dvi15yemjjwva1cCCKb5vbCRy3BN5a4QVNxBlnkHCRZQO06QplO7B
	nwp8NEeUGVL3A/sW6KAE+jejrbatqvj3gZbVIdtX6KOZ+9PKfONCs+oYDslJ7Gwmtr5T
	zsCw==
X-Gm-Message-State: ALoCoQngk8OBV4IhBeyqCy5RH4p/n/sWKaGjNvCBbFOQpbxsZNy2MrkknfzQnjiMAU++euHlOCVE
X-Received: by 10.50.137.71 with SMTP id qg7mr16355962igb.24.1406035147434;
	Tue, 22 Jul 2014 06:19:07 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id il3sm2273320igb.1.2014.07.22.06.19.06
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jul 2014 06:19:06 -0700 (PDT)
Message-ID: <53CE64C9.2010402@linaro.org>
Date: Tue, 22 Jul 2014 09:19:05 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Paul Eggleton <paul.eggleton@linux.intel.com>
References: <alpine.LFD.2.11.1407130915280.31826@localhost>	<3072899.OS8yJTfGtp@peggleto-mobl5.ger.corp.intel.com>	<alpine.LFD.2.11.1407140804360.29952@localhost>
	<28111309.Fiim3rPSbe@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <28111309.Fiim3rPSbe@peggleto-mobl5.ger.corp.intel.com>
Subject: Re: overriding tasks with EXPORT_FUNCTIONS
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
X-List-Received-Date: Tue, 22 Jul 2014 13:19:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07/14/14 08:26, Paul Eggleton wrote:
> Unfortunately as far as the BitBake manual is concerned, it pretty
> much has to be abstract. Remember that there are no base
> implementations of any task functions in BitBake itself; the ones you
> refer to are in OE's base.bbclass.

In reality there are only about 2 people on the whole planet for whom
that distinction is important :-)

For the rest of us, it would be nice if there was some middle ground
from which a document could be written that treated these two entities
as one; at least up until such a time as some other project comes along
and uses bitbake for something other than OE/Yocto :-D

