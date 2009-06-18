Received: from [74.125.46.152] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <acassis@gmail.com>) id 1MHGfE-0002Fj-NX
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 14:24:20 +0200
Received: by yw-out-1718.google.com with SMTP id 5so394670ywm.30
	for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 05:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=K42DU/D7KqtpHBwklcJDiv/jm+m4K/aM/xg7JVP6ays=;
	b=v7OBa7H595J72SInK5uHoQvl4qjH5536xwF9KowdMvmIqACiY0yoUOOBegxew6qgFi
	7eVKV4Nej/m5qBzvXkt0n5YP/opFzWG/K5w1s2YngjF0Cod/1XADaJ5I4JYfS+WhZCG7
	Szu8H1T5RurH9kxa/bI+s/LHfSr0Y6OoNMV9w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=Q28XQ32M37w+gr8yX4FLMJWSXTpuSjl4sRnCcpRAdVQ6vnxj0nQQ22WYhEWJWOfNCD
	1FHpaIfraYJqSlp1afAPi8o2nr+6gq0T+fsGTb37stK05kB/Foexn/yt6FBrulpsS3ge
	P4jyw/uUd4i6uQs+CC2cRdLXMTcP/UFZK3hqQ=
MIME-Version: 1.0
Received: by 10.151.46.15 with SMTP id y15mr3413456ybj.302.1245327228805; Thu, 
	18 Jun 2009 05:13:48 -0700 (PDT)
In-Reply-To: <h1cj1r$mps$1@ger.gmane.org>
References: <37367b3a0906171701h2a5b7f38wf1f52ebeead3972d@mail.gmail.com>
	<h1cj1r$mps$1@ger.gmane.org>
Date: Thu, 18 Jun 2009 09:13:48 -0300
Message-ID: <37367b3a0906180513r5cc4c8f0td11695a468bb8a3e@mail.gmail.com>
From: Alan Carvalho de Assis <acassis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: Error building busybox_1.13.2
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
X-List-Received-Date: Thu, 18 Jun 2009 12:24:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 6/18/09, Rolf Leggewie <no2spam@nospam.arcornews.de> wrote:
> Alan Carvalho de Assis wrote:
>> Hi list,
>>
>> I am updating mx27ads as suggested by Tom Rini, but I found an issue.
>>
>> The busybox_1.13.2 is broking during the do_install phase.
>>
>> It is looking for:
>> tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.13.2-r22.1/simple.script
>
> Pull and retry.  It should be fixed in .dev
>

Thank you Rolf!

It worked like a charm!

Regards,

Alan


