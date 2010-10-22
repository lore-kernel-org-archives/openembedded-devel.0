Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P9BLS-0001ee-At
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 08:43:18 +0200
Received: by fxm3 with SMTP id 3so445316fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 23:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=+GEItmj68QTRGuy5yqXZ4bQ/wzLCQ2ubziaBrbl//I0=;
	b=Qk8ki0UhTNAXTFxVstAPvY2ZrZrDAduEeTSss7CItAQMkgRzWHeleCJ8/osSww9ycE
	6XcrCDIuPnkBc5dF+AYQyVmvLWUKKvgIl0xXyO093OqSTVGorwiICZckovHzb+dMy5U8
	yOjEzw72y0oxNcTmAg38cQzNUXgf599/rndjw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=gWme3hBX9TnIE6MojGCJu4gC8lSATcEIBAcoPKNZns6nQc3lTE6jMrBTTDoopuCLy5
	bWYLf0aOxJjgT50dxIH4io7X9Wktqp7xZexiXzhVSuwSd0yERyMd+r4q5ySSqsyWxWJX
	LPL5nkFH7TmGiVEhOeWqHlFM64QvqVJxyEhx8=
Received: by 10.103.52.8 with SMTP id e8mr2629633muk.114.1287729755639;
	Thu, 21 Oct 2010 23:42:35 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u8sm1265230fah.12.2010.10.21.23.42.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 23:42:34 -0700 (PDT)
Date: Fri, 22 Oct 2010 08:42:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101022064239.GB3527@jama>
References: <4CC04756.2020004@nedap.com>
 <4CC13039.4020002@nedap.com>
MIME-Version: 1.0
In-Reply-To: <4CC13039.4020002@nedap.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: failure building cacaoh-native
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
X-List-Received-Date: Fri, 22 Oct 2010 06:43:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 22, 2010 at 08:33:29AM +0200, Jaap de Jong wrote:
> The same applies for cacaoh-openjdk-native.inc and probably also for 
> cacaoh-cldc-native_0.98.bb
> Patch will be:

Can you send it as proper patch? Also please for previous cacaoh-native
patch. 

http://wiki.openembedded.net/index.php/How_to_submit_a_patch_for_dummies

BTW: are you using libtool-2.4 or old libtool-2.2.6b? Because I
see this only since using libtool-2.4 and someone should check that this
patch wont break build for people using 2.2.6b.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


