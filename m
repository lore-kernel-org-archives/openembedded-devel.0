Received: from [91.198.206.2] (helo=mail.smartlink.ee)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kalev@smartlink.ee>) id 1KvVEQ-0005gL-Bx
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 11:58:26 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.smartlink.ee (Postfix) with ESMTP id 9D394311AB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2008 12:57:25 +0200 (EET)
Received: from mail.smartlink.ee ([127.0.0.1])
	by localhost (mail.smartlink.ee [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CoDgTcpJdJAQ
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2008 12:57:25 +0200 (EET)
Received: from [192.168.2.59] (wumpus.smartlink [192.168.2.245])
	by mail.smartlink.ee (Postfix) with ESMTP id 43F9530A13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2008 12:57:25 +0200 (EET)
Message-ID: <49099314.5030909@smartlink.ee>
Date: Thu, 30 Oct 2008 12:57:24 +0200
From: Kalev Lember <kalev@smartlink.ee>
User-Agent: Thunderbird 2.0.0.17 (X11/20080926)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20081030101903.GA8716@walkingice>
In-Reply-To: <20081030101903.GA8716@walkingice>
Subject: Re: A patch for autotools.bbclas which correct .la file
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
X-List-Received-Date: Thu, 30 Oct 2008 10:58:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Julian Chu wrote:
>         It supposed to be replaced by autotools.bbclass. However, it
>         doesn't work when a recipe inherit autotools and overwrite do_install.
>   

Hello,

I think it might not be a good idea to do it in do_install_append(),
because lots of recipes which inherit autotools bbclass also define
do_install_append(). So the current approach would fix some, but break a
set of other packages.


-- 
Kalev


