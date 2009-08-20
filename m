Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MeAUs-0003QA-Td
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 18:28:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id C61CE543772
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 12:11:00 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18446-08 for <openembedded-devel@lists.openembedded.org>; 
	Thu, 20 Aug 2009 12:11:00 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id A2F08450003
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 12:11:00 -0400 (EDT)
Message-ID: <4A8D7594.4000606@cbnco.com>
Date: Thu, 20 Aug 2009 12:11:00 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
	<Pine.LNX.4.64.0908200802190.3621@juice.ott.cti.com>
	<b6ebd0a50908200821r1cff2f42q4be6e8064abd76db@mail.gmail.com>
In-Reply-To: <b6ebd0a50908200821r1cff2f42q4be6e8064abd76db@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] cross.bbclass: keep TARGET_SYS & TARGET_PREFIX	independent.
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
X-List-Received-Date: Thu, 20 Aug 2009 16:28:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Chris Larson wrote:
>> Can you explain for a crosscompile noob -- when would TARGET_PREFIX !=
>> ${TARGET_SYS}-? I understand they're separate variables so they COULD be
>> different; just wondering why someone would set them that way.
> 
> The only case that comes to mind is when using external toolchains.
> They aren't all so kind as to be arch-vendor-os-<foo>.

Cool, thanks for the explanation. For what it's worth,

Acked-by: Michael Smith <msmith@cbnco.com>


