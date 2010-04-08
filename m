Received: from mail-ew0-f225.google.com ([209.85.219.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tasskjapp@gmail.com>) id 1NzlbC-0001Kr-1b
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 08:52:22 +0200
Received: by ewy25 with SMTP id 25so917494ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Apr 2010 23:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=skiFuwwZPySNNQKhewaLnzxuHUjPMvkHcW/0MMtFJcM=;
	b=iatlu4aMWd0QHEf6+Nrc2Nkctl+c8RFgalFlZAsjCu4m9bmOjDCDdwPA1L91Izwo5J
	JsWRaUh6qJQgO/+M8Hk7mSQmwJiIUqMkBlYAU9LkILnqw1vGO5kvOZEh2aw9+sAKzI8W
	10hG9fICvY/nvFA6LVMHFhUbo0g4rOtswegDI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=SjNFEHWoxSbL+m2ChjFlEb9lz9m1zTxOI6aai9CVGcxHgSzg3GeFUJ0gy2j+ueQ4Pe
	6OcDhoQab4hhaI38Q6GNa/W2Ve1d2O10FQXT8RfiVd1pQ92LNamxdW+fW19Uwla79mg7
	+8FnZx28GLIdiKPGpuil8DYec1l7aGtV/Uznw=
Received: by 10.213.46.74 with SMTP id i10mr2564205ebf.36.1270709339481;
	Wed, 07 Apr 2010 23:48:59 -0700 (PDT)
Received: from [192.168.0.49] (147.84-49-231.nextgentel.com [84.49.231.147])
	by mx.google.com with ESMTPS id 16sm8523065ewy.3.2010.04.07.23.48.58
	(version=SSLv3 cipher=RC4-MD5); Wed, 07 Apr 2010 23:48:58 -0700 (PDT)
Message-ID: <4BBD7C9C.2020404@gmail.com>
Date: Thu, 08 Apr 2010 08:50:04 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.10pre) Gecko/20100407 Shredder/3.0.5pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.2582.1270656222.24517.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.2582.1270656222.24517.openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.219.225
X-SA-Exim-Mail-From: tasskjapp@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SDK for BeagleBoard development - how do I add linux-omap headers?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Apr 2010 06:52:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

>
> Like the topic says I'm trying to create an SDK to let people develop
> >  for a BeagleBoard running Angstrom. I have followed the instructions in
> >  the manual on creating an SDK, and have a basic one compiled.
> >  
> >  I included linux-libc-headers, but found out that it gives me only the
> >  "vanilla" kernel-headers, while I need the linux-omap-headers with all
> >  the needed patches. How do I get those into the SDK?
>    
> Why do you need these headers?
>    

We have code that writes video directly into framebuffer, and it needs 
to include <"linux/omapfb.h">.


