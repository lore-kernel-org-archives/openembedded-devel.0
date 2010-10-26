Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1PAmI4-0002r5-Hg
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 18:22:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 7D5148D88DA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 12:21:40 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10445-09 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 26 Oct 2010 12:21:40 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 4B87A8D85E7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 12:21:40 -0400 (EDT)
Message-ID: <4CC70013.2090004@cbnco.com>
Date: Tue, 26 Oct 2010 12:21:39 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CC6F440.10509@opendreambox.org>	<131E5DFBE7373E4C8D813795A6AA7F0803110B3CFC@dlee06.ent.ti.com>
	<4CC6FDB2.6050401@opendreambox.org>
In-Reply-To: <4CC6FDB2.6050401@opendreambox.org>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Use of == in shell scripts
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
X-List-Received-Date: Tue, 26 Oct 2010 16:22:25 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Andreas Oberritter wrote:
> On 10/26/2010 05:51 PM, Maupin, Chase wrote:

> I understand that bash is a requirement for now, but if possible, that
> should be changed. I don't think that root access to a machine should be
> necessary to build OE on Ubuntu (or maybe even on BSD flavors).

Well, maybe Ubuntu should be changed to use bash :)

>> If I remember correctly in bash "==" will also work with numbers whereas "=" is only for strings.
> 
> Both bash and dash on my system handle "[ "0" = 0 ]" or [ "0" = 1 ]
> correctly. Another operator "-eq" exists, which is only for numbers.

 From what I can see, it looks like = and == are equivalent in bash, so 
we should use = so we're not tied to bash.

-eq is for numeric comparison. For example, [ 01 -eq 1 ] but not
[ "01" = "1" ].

Mike


