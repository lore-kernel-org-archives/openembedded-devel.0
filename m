Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1PfaTn-0005Y8-QK
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 17:01:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id A36EFA47A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 16:01:12 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 34utPoVXkw7Y
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 16:01:11 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id C3471A479A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 16:01:11 +0000 (GMT)
Message-ID: <4D370AC6.5080906@xora.org.uk>
Date: Wed, 19 Jan 2011 16:01:10 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D36F9BE.1010601@xora.org.uk> <4D370424.9000808@eukrea.com>
In-Reply-To: <4D370424.9000808@eukrea.com>
X-Enigmail-Version: 1.1.1
Subject: Re: openembedded-core git repository
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
X-List-Received-Date: Wed, 19 Jan 2011 16:01:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 19/01/2011 15:32, Eric B=E9nard wrote:
> Hi,
>
> On 19/01/2011 15:48, Graeme Gregory wrote:
>> It seems to be on a technical level we are agreed that we should split
>> parts of OE out into the so called openembedded-core which will have a
>> stricter commit access and higher QA requirements on changes.
>>
> (this question may be stupid as I haven't yet read the other thread
> concerning Yocto/OE).
> What is openembedded-core vs
> http://cgit.openembedded.net/cgit.cgi/meta-openembedded/ ?
>
It is the distilling of toolchains/classes/basic tools from OE/poky to a
small tightly controlled repository with tighter access controls with
the aim that making a minimal image out of this repo should always work
(tm). Basically the minimal subset of OE that is still useful.

meta-openembedded then builds on this to give the rest of OE that we see
now.

Graeme



