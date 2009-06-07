Received: from [17.148.16.94] (helo=asmtpout019.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MDH4E-0005Ei-Oo
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 14:01:39 +0200
MIME-version: 1.0
Received: from [87.201.169.74] by asmtp019.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KKV002DSAAYPF60@asmtp019.mac.com> for
	openembedded-devel@lists.openembedded.org; Sun,
	07 Jun 2009 04:52:14 -0700 (PDT)
Message-id: <E220332E-DED8-4228-A749-61DB4896A02A@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: Phil Blundell <pb@reciva.com>
In-reply-to: <1244373743.4151.24.camel@lenovo.internal.reciva.com>
Date: Sun, 07 Jun 2009 15:52:06 +0400
References: <4E17E8CF-AA3B-4929-BC22-B9B28A757035@mac.com>
	<1244367963.4151.5.camel@lenovo.internal.reciva.com>
	<618E409A-94E7-486B-B6CF-6D2F01FF08B6@mac.com>
	<1244369313.4151.9.camel@lenovo.internal.reciva.com>
	<94920284-2A1B-4EFC-83A0-F445BFDE92B9@mac.com>
	<1244371661.4151.14.camel@lenovo.internal.reciva.com>
	<1F1DD9C5-164F-4137-88B5-FD9C7F60BCDC@mac.com>
	<1244373743.4151.24.camel@lenovo.internal.reciva.com>
X-Mailer: Apple Mail (2.935.3)
Cc: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Subject: Re: linux-omap3_git.bb	doesn't	work	when	copied	to	user.collection
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
X-List-Received-Date: Sun, 07 Jun 2009 12:01:40 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi Phil,
		I think I know how this might have happened. While developing a new  
recipe based on linux-omap3_bit.bb, I aborted a download, once I saw  
that it was working.

After that, all subsequent attempts were trying to probably use that  
aborted tar ball and extracting the git repository and that repository  
probably was corrupted or something.

Can OE be enhanced to avoid this situation, by comparing the checksum  
of the tar ball, before attempting to extract and use it?

Best regards,

Elvis




