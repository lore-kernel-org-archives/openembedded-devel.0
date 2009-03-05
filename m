Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LfFWs-0003hu-2C
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Mar 2009 16:30:34 +0100
Received: by fxm11 with SMTP id 11so3287091fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2009 07:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=zXXOPq+wcf0b2/T2657RU+33jCDRg4etaudo6c9aYN4=;
	b=iMybzAHgCwy3xPv6n7sPMb4vz35FaSkM85x7Chnr8VmsLurfqONPMtLLfj2MVJqOac
	kN4fNkw/5N9qUQsAyYMrvTAL7cgGzWhuYZ1Gmh5/e+Ojo4pKmb5dJguZpDTjMkvDnKEE
	VUCHPoFckAfQ+VK0xeQ6jyzucZrNsCJ9MuvsE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=GlMgoi0w7dLSNDQ7n3Is3vv4srFAMpUMsVh+5d1kDyuQM+dEiR8T6+s3RtkgYSOZu4
	2sv5ObKV7OwP+vnGsHKIU3B9UKExTJ9WA85VIelDhrThKB9PS4wTac4f1YXg5VpX9IRZ
	j3RhJfqCUyNJ8bQ0PYCVMdgq75nmYuHNd6sPo=
Received: by 10.103.172.9 with SMTP id z9mr589279muo.109.1236266771562;
	Thu, 05 Mar 2009 07:26:11 -0800 (PST)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id y2sm137231mug.45.2009.03.05.07.26.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 05 Mar 2009 07:26:10 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id D75996101CE; Thu,  5 Mar 2009 12:26:08 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <1236023043.6800.1174.camel@alap> <goilla$vh8$1@ger.gmane.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Thu, 05 Mar 2009 12:26:08 -0300
In-Reply-To: <goilla$vh8$1@ger.gmane.org> (Koen Kooi's message of "Tue, 03 Mar
	2009 08:19:06 +0100")
Message-ID: <87k5742dpr.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: New recipe for openmoko QA test scripts
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
X-List-Received-Date: Thu, 05 Mar 2009 15:30:34 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

> On 02-03-09 20:44, Angus Ainslie wrote:
>> Please review for any policy violations.
>>
>> Thanks
>> Angus
>>
>> --- openembedded/packages/openmoko-projects/openmoko-qa-scripts.bb.oring        1969-12-31 17:00:00.000000000 -0700
>> +++ openembedded/packages/openmoko-projects/openmoko-qa-scripts.bb      2009-03-02 12:38:55.000000000 -0700
>> @@ -0,0 +1,19 @@
>> +DESCRIPTION = "Openmoko QA test scripts"
>> +SECTION = "utils"
>> +LICENSE = "GPL"
>> +PV = "gitr${SRCREV}"
>
> NACK, as pointed out numerous times before: git revisions don't sort,
> so the above breaks upgrade paths.

Our proposal to use git describe solves this :-)

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


