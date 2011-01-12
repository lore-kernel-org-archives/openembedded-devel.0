Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Pcw0H-0007hh-1C
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 09:24:28 +0100
Received: by fxm17 with SMTP id 17so290568fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 00:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=vld6SLk0tLsQAkybXjAdGA8rjSAjpKpVl0w4LXzG8oU=;
	b=b3lDQxyNes17UT1id7yNZaj6tB4D09BpyDZMQAIWHhfiaXr1wAaBYYe0agzxwNmC5d
	EOWOz1x56GjBOF3OweqH4SekTrg1Uk+z4gIcetq7/CTBKwYB75k7BvGQGFIeKx/moNaG
	W/mFhuhAVEQHzD4QT0dpz0IRhpKQZYgsH1O5U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=w9Bdy1WwQgUKJbQFnErjZ7Gxr5jsdQaSGioc+Yl/h8uPR+P5QBAeY67uok9E8vUkNO
	STIGzieOpS+WJyc3vryQck8bnApjV6R86u1jFsgXR3ZRiPl8kq0JAfHKvD3cQPnzstpo
	peT4ozEk5aizqJyaZ2sF7LIWZYzeDtfatN9UU=
Received: by 10.223.120.193 with SMTP id e1mr646421far.106.1294820633530;
	Wed, 12 Jan 2011 00:23:53 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id l14sm81736fan.33.2011.01.12.00.23.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 Jan 2011 00:23:52 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Pcvzi-0005UV-Eq; Wed, 12 Jan 2011 09:23:50 +0100
Date: Wed, 12 Jan 2011 09:23:50 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110112082350.GA20908@mx.loc>
References: <1294318110-23521-1-git-send-email-obi@opendreambox.org>
	<1294318110-23521-3-git-send-email-obi@opendreambox.org>
	<4D2CBE1D.9030303@opendreambox.org> <20110111214814.GH6584@mx.loc>
	<4D2CD77E.5070409@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4D2CD77E.5070409@opendreambox.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 3/4] unpack.py: add SRC_URI parameter unpack=<bool> (default: true)
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
X-List-Received-Date: Wed, 12 Jan 2011 08:24:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 11, 2011 at 11:19:42PM +0100, Andreas Oberritter wrote:
>Hello Bernhard,
>
>thanks for your review. When creating the patch I tried to use the least
>invasive way, i.e. to change as few lines of code as possible, in order
>not to break anything. Most of your remarks apply to already existing
>code which was either copied or indented. I think, that your suggestions
>should be incorporated in a later patch by someone more experienced in
>python than me.

>> a default of False to to_boolean -- which will return False "if not
>> string" (and should
>> if not string or not isinstance(string, basestring):

the isinstance remark is of course nonsense, please disregard it.
>> 	return False
>> , as a sidenote)
>> is superfluous.

>That's just changed indentation of already existing code.

So let's leave the potential cleanup for a future patch.

Reviewed-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>


