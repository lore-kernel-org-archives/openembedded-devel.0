Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Oger1-0006lD-I2
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 16:22:01 +0200
Received: by fxm12 with SMTP id 12so2489023fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 07:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=nTTo9guC/3U4PiHM9kJyatYBIJdVzdTrglhKm4ThssA=;
	b=XxPoHOv7v9tWbUFmvgHNBYDFRbUw9bm9gQrHiQTIwr7/S6LNuSaEsJeyIvppXXdIcM
	ZMqlDQyoft85FoGgdx922aM08bPfleqZolV5gaqmUwRaM4ELG7rnEwi8jgBKrzW4B17X
	ItxtSVk4AiUj9n8jdKCu9O5utO2G5u2YmOstA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=lAkQMA6USLDnmC66lo6rfROQOT5VN81gRJWuTDlBIBhJbvKuluXbTXYyGaDawEVmNF
	ozGHRUCsT7ij/IASJZ4HmhkeV8UrNPtKV4KMzRgooO1gzRM2BOA3f3CCc9JJdHiCH+Yh
	I60QUzUK5gll4ikOMlnMdPh2VvKDHgM7gDb7s=
Received: by 10.223.119.198 with SMTP id a6mr9018232far.66.1280931715536;
	Wed, 04 Aug 2010 07:21:55 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id c5sm2985857fac.19.2010.08.04.07.21.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 07:21:52 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Ogeqp-0006Os-6w; Wed, 04 Aug 2010 16:21:47 +0200
Date: Wed, 4 Aug 2010 16:21:47 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100804142147.GE28187@mx.loc>
References: <1280929918-23818-1-git-send-email-rep.dot.nop@gmail.com>
	<1280929918-23818-2-git-send-email-rep.dot.nop@gmail.com>
	<201008041807.06239.khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <201008041807.06239.khimov@altell.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] perl: use only one method all_perl_packages
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
X-List-Received-Date: Wed, 04 Aug 2010 14:22:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Aug 04, 2010 at 06:07:06PM +0400, Roman I Khimov wrote:
>В сообщении от Среда 04 августа 2010 17:51:57 автор Bernhard Reutner-Fischer 
>написал:
>> .. to avoid
>> ERROR: Error Method already seen: all_perl_packages in' perl_5.8.8.bb'
>> now in 'perl_5.10.1.bb'
>> 
>> TODO: error() already prints "ERROR:" so the "Error" in above msg is
>> redundant
>> 
>> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>
>What kind of configuration gives you such an error? Never seen that.

It was applied by Chris as a5dee57033f7d9987858d2c0514f4e687ece2874
>
>Although the change itself looks good, I'd only probably rename 
>perl_helper.inc to plain perl.inc, we can merge more common things between 
>different perl versions later.

fine with me, sure.
>
>Acked-by: Roman I Khimov <khimov@altell.ru>


