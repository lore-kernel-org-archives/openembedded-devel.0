Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OX9cS-00024K-7p
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 11:11:41 +0200
Received: by gwj22 with SMTP id 22so1127633gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 02:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=eMwI87nHA4vEHogdVMToAsrcGy7X1CKEtplct7rkYIM=;
	b=UlTIqzuiMRwBAVYYV+S47NEHkV/c+YPNskEu6WyCbod26o3qctW486NU0z4dEZ7DiA
	Uo6HBNE304omVrgZlwBpn77C71zcZk5N2JRNPyDjusqvZKY3M8t80vRFKrUxS334957j
	7+zEniUnq+Md5h+QieUHE9vrzuO0PkT/QkRCY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=e4BRde3qXGh8zryMguAS4iHL8sy7o5y0ac7aVmhJ7QtsHyoiUBSc8qqTZAHSUoGKmt
	otr1AkNXb33goj8tKj7p5Mx9VJMtawXIcGHX29p1KZsuiNtTVMcWbsCh/+ApLZMcQgCo
	kPh1YrSpxzlFuVgmQcVzlDt19D2dgCpIEBc4s=
MIME-Version: 1.0
Received: by 10.90.78.4 with SMTP id a4mr8076089agb.45.1278666405960; Fri, 09 
	Jul 2010 02:06:45 -0700 (PDT)
Received: by 10.231.157.196 with HTTP; Fri, 9 Jul 2010 02:06:45 -0700 (PDT)
In-Reply-To: <201007091049.09034.schnitzeltony@gmx.de>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819DAE@deimsg40.de.net.world>
	<201007091049.09034.schnitzeltony@gmx.de>
Date: Fri, 9 Jul 2010 18:36:45 +0930
Message-ID: <AANLkTikqIZ98yYz8ZCRxqTu3cAqveZSKebTL-VeKkV4_@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Best practice to resolve dependency loops ?
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
X-List-Received-Date: Fri, 09 Jul 2010 09:11:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 9 July 2010 18:19, Andreas Mueller <schnitzeltony@gmx.de> wrote:
> bitbake supports -g for dependency trees in dot syntax. What is the best tool to browse these files. I checked graphviz but this just paints complete unviewable posters. Is there e.g something like
> a dot to html converter aavialable?

I found it easiest to run contrib/dependsgraph/dependsgraph.sh and
read the reduced.dot file directly in a text editor.

-Graham


