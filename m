Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NkYO7-00038q-LV
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 08:44:03 +0100
Received: by wwb22 with SMTP id 22so1668070wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2010 23:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=fNOQFfMosA+e8EjjWuX1TOWotKY5Z+R18O7NSc7XZKQ=;
	b=XESfZgCH3T66t+8/7J+5AKmlvc+d/cQ5GUR7G83v9l2X0NfP3yOWNve1EhWO+gxc71
	yHxDvri9BoWQTgYSe+ne8eDZHamS9WL7eIp74KpN2Vu1zYyvXhIyE9wtJJpQGF10sVS9
	+s5LMIBa6eFycfGPa0T8Ss5njB/kgsXVpRg74=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Xg8tkvtxOhqnHG3WoYmr6c5Umg3Xirdgk7c50A1EO6IoKmm+DQ5oB5d5Xk8OgkPgsF
	zz9ZtTgmi6ELd+1XObbsYe+ypbJoiRajSrCHn3TpSLcQW977ncKau+hpwOuZRAtbVHNb
	xpmx6tBDH9cT63ySccOJrMU/N4yHbX5MCI7Rk=
MIME-Version: 1.0
Received: by 10.216.90.136 with SMTP id e8mr407978wef.110.1267083672768; Wed, 
	24 Feb 2010 23:41:12 -0800 (PST)
In-Reply-To: <1267058975.18176.527.camel@trini-m4400>
References: <1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-5-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-6-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-7-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-8-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-9-git-send-email-rep.dot.nop@gmail.com>
	<1265892781.3777.1050.camel@mill.internal.reciva.com>
	<20100213125146.GJ10632@mx.loc> <20100213161449.GD30265@mx.loc>
	<1267058975.18176.527.camel@trini-m4400>
Date: Thu, 25 Feb 2010 08:41:12 +0100
Message-ID: <9930fb0a1002242341p3d8de096s1521431677f8dcbc@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: BBCLASSEXTEND canadian?
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
X-List-Received-Date: Thu, 25 Feb 2010 07:44:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Canadian seems to be deprecated in favour of nativesdk (which is handled by
BBCLASSEXTEND), so I will try use that instead.

On 25 Feb 2010 01:50, "Tom Rini" <tom_rini@mentor.com> wrote:

On Sat, 2010-02-13 at 17:14 +0100, Bernhard Reutner-Fischer wrote:
> On Sat, Feb 13, 2010 at 01:51:4...
Since I didn't see a reply... at current, yes BBLCASSEXTEND only covers
-native (and not -cross, -cross-sdk/-sdk nor -canadian*).

--
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

