Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1LwxUB-0006ZL-89
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 13:52:59 +0200
Received: by ewy20 with SMTP id 20so435059ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2009 04:48:20 -0700 (PDT)
Received: by 10.210.130.14 with SMTP id c14mr3428652ebd.66.1240487299954;
	Thu, 23 Apr 2009 04:48:19 -0700 (PDT)
Received: from xora-eee.xora-domain (93-97-174-2.zone5.bethere.co.uk
	[93.97.174.2])
	by mx.google.com with ESMTPS id 10sm1825884eyd.22.2009.04.23.04.48.19
	(version=SSLv3 cipher=RC4-MD5); Thu, 23 Apr 2009 04:48:19 -0700 (PDT)
Message-ID: <49F0557D.4080009@xora.org.uk>
Date: Thu, 23 Apr 2009 12:48:13 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1b3pre) Gecko/20090324 Fedora/3.0-2.1.beta2.fc11
	Thunderbird/3.0b2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <gspjtp$2p3$1@ger.gmane.org>
In-Reply-To: <gspjtp$2p3$1@ger.gmane.org>
Subject: Re: kexec-tools-static question
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
X-List-Received-Date: Thu, 23 Apr 2009 11:52:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/23/2009 12:37 PM, Dmitry Eremin-Solenikov wrote:
> Hi,
>
> I've stumbled upon kexec-tools/kexec-tools-static package. Currently it's packaged
> inside generic feed (e.g. armv5te in my case). However it uses kernel headers
> and klibc which are machine-specific IIRC. Shouldn't kexec-tools-static be built
> with PACKAGE_ARCH = "${MACHINE_ARCH}" instead?
>
> As a side note: kexec-tools-static fails to build for tosa as the staged 2.6.29
> kernel doesn't contain machine-specific headers (will look at it soon).
>
>    
Look back in the mailing list archives, this is/has been/being discussed 
already!

Graeme



