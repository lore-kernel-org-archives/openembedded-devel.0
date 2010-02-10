Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NfFkL-0000FN-K4
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 17:49:04 +0100
Received: by fxm25 with SMTP id 25so195075fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 08:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=vtAeJTesV4hOY+BDnBJT2Rm+e1HS7UwuGMIRyI5cNXE=;
	b=I104iVUss35CmAGds8/i9LhiIXRQF48/dSXi5A6RfwJ/MywKIHg4QSqkE5QUrYTQqS
	bQYHNJCJ2sBdZCyRefvUmdBbY7Dno47wyWxhOqr92lORdXUE+yh1fnNdJomVUfk2rOu/
	mbhVSFPzDaJdfMjrYkT4+Xi4erc+Sbekmn9Ps=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=KdN1UcVSsVpMbpLXK/e/GumKijsDMLtels0eVv8fuB1YiUGKoFY3vM1DIbu/GsC24W
	PqrLRYfPTYnMMUBSNj3QJLT5S5mDQpd/zWdIk3fKyX8SeRrLxbZuJqZjxrqXz2vQE9oe
	j033ZVEM2UNIu340zwkXhIs09tFDlBM+eMzwg=
Received: by 10.223.75.66 with SMTP id x2mr663972faj.7.1265820387062;
	Wed, 10 Feb 2010 08:46:27 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 22sm2276693fkq.54.2010.02.10.08.46.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Feb 2010 08:46:23 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NfFjp-0003dN-OO; Wed, 10 Feb 2010 17:48:29 +0100
Date: Wed, 10 Feb 2010 17:48:29 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100210164829.GB13636@mx.loc>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-5-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-6-git-send-email-rep.dot.nop@gmail.com>
	<1265666186.6761.3.camel@lenovo.internal.reciva.com>
	<20100209085019.GA1663@mx.loc>
	<1265705811.6761.7.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1265705811.6761.7.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 05/12] no need to set LD nowadays
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
X-List-Received-Date: Wed, 10 Feb 2010 16:49:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 09, 2010 at 08:56:50AM +0000, Phil Blundell wrote:
>On Tue, 2010-02-09 at 09:50 +0100, Bernhard Reutner-Fischer wrote:
>> It seems that the .dev tree has 1.2.1, 1.2.2, 1.3.1 still in there but
>> i, personally would strongly advise against using those (same for the
>> standalone tinylogin, but that's a different thing and not relevant
>> right now).
>
>As long as those versions are there, I don't think it would be
>acceptable to check in a patch to busybox.inc which would delete them.
>Leaving the ${LD} setting as a comment doesn't really help with that.
>
>If you wanted to generate a new patch which added the ${LD} setting to
>the individual recipes that still require it, and simultaneously delete
>it from busybox.inc, then I think that would be fine. 

Ack, i retract this patch for now.
Thanks,


