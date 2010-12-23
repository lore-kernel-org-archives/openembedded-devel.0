Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1PVozV-0005YO-Ji
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Dec 2010 18:30:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id B85B71C050
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 17:30:05 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Uhq9mzTcJe87
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 17:30:05 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 3627EA5B59
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 17:30:05 +0000 (GMT)
Message-ID: <4D13871A.6040001@xora.org.uk>
Date: Thu, 23 Dec 2010 17:30:02 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D13843E.3070304@freyther.de>
In-Reply-To: <4D13843E.3070304@freyther.de>
X-Enigmail-Version: 1.1.1
Subject: Re: curl-native and requiring ldap
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
X-List-Received-Date: Thu, 23 Dec 2010 17:30:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 23/12/2010 17:17, Holger Freyther wrote:
> Hi all,
>
> I finally have a machine that is fast enough for OE again. I have a build
> failure in curl-native as it tries to link to -ldap and -lrt. I have seen the
> recipe changed a lot since the last time I looked at it. What is the best way
> to insert --disable-ldap for the native build?
>
EXTRA_OECONF_virtclass-native = "--disable-ldap"

Graeme



