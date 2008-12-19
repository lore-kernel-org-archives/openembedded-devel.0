Received: from [209.85.142.184] (helo=ti-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dangbinghoo@gmail.com>) id 1LDful-0006Jg-9w
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Dec 2008 15:01:15 +0100
Received: by ti-out-0910.google.com with SMTP id d10so656946tib.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2008 05:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=JnfwlghzKS8vtc/z1AJa57k0uD3LvQSvzwayE290e1s=;
	b=xzsQ69r5rW2mm9T3jN3GOIkS4KnXP4EJMNPImR6jOgJbCd2t8girmTKRxZh22WiuHx
	TGE1WdHXxn1/qr+GHsmj6I4T5KXOdc/2N5cozQbs39ukK8ISYlSkdyWNDZs/Xf6mFsSe
	GgOQU7eWEY8IPufiDcTuaTUniDi674lWQTuuY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=b1DuYUhSz6kbvdrmGTYTw+f/uueDNWlBvEfeK9BALQ7kKOYW/le8UnNrV/Us6YEFHg
	OyJybqyQwHO3x7EjZVuEsD8E1176PWaF9iwQnkb1QWXG9pt667u6Adx71XiJNXSR6YFf
	GbmGVl1/b6PEHMwzieNGYZ7wMbyKDO1YWYXc4=
Received: by 10.110.53.19 with SMTP id b19mr4772478tia.38.1229694993833;
	Fri, 19 Dec 2008 05:56:33 -0800 (PST)
Received: from ?192.168.2.20? ([119.5.62.148])
	by mx.google.com with ESMTPS id y3sm814798tia.20.2008.12.19.05.56.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 19 Dec 2008 05:56:32 -0800 (PST)
Message-ID: <494BA831.9090405@gmail.com>
Date: Fri, 19 Dec 2008 21:57:05 +0800
From: Binghoo Dang <dangbinghoo@gmail.com>
User-Agent: Thunderbird 2.0.0.16 (X11/20080807)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <494B4E6B.6010607@mgb-tech.com>
In-Reply-To: <494B4E6B.6010607@mgb-tech.com>
Subject: Re: ARM - OE Linux, Java and SerialPort
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
X-List-Received-Date: Fri, 19 Dec 2008 14:01:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Jan Pannecoeck 写道:
> Hello everyone,
>
> I'm not sure if this is the right mailinglist, but I'll post my 
> question here so maybe someone could help me. I'm currently using an 
> OE linux distribution on my ARM board, this is all working fine and 
> I'm using jamvm to run my java programs. Now I would like to 
> communicate with a SerialPort. But the Java Communication API provided 
> by Sun does not support an ARM based system. Only the Linux x86 system 
> is supported. Since Linux is using the serial port as a "file", the 
> reading and writing part could probably be done using a simple Reader 
> and Writer in Java, but how can I change the baudrate and other 
> configuration settings of the serial port?
>
> Does anybody has any experience with this?
>
> Kind regards, and a early happy christmas!
>
> Jan Pannecoeck
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
You can read 《linux device drivers》and found out a "way" to control the 
SerialPort ,all operation is using a "file" interface. Good luck!


