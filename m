Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q9OxY-0005MI-9N
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Apr 2011 23:47:48 +0200
Received: by iwn10 with SMTP id 10so6497966iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2011 14:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=ajTTFFcmzIEN3fUNkYuil+0sSwPAxWSVj+QD6OdszjU=;
	b=UaP6LaqW+4gkQ14qbdxZmdP7W5UJQEoBriAIoJDL941cjC12KOztaMlSVhyni7fmlX
	wgIU1iHDsngy9XHPHVU3rRzDTvy+Je3MyjvGHDooCIyFVGN/PYSsEI/cp1vyYflr57t7
	XuFEDxbDD0RDIwIs3P1mq9eyoMp/3qOsQFIJI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=WeqO491XfCa7XjCNbsKE7Gs/hNti4Am4ScrCEgbQy7DAqu/XvEFcRzoWAUa+qMXlkd
	3r+YQrpttQ6o3H5CJM2Ha8dW2YlkbhTZvkhWmByT6JnUYJ3iFvyxCmodTSDecYh33Sms
	0uUO7WzUtpgAjoz5Qu272g3gMZHmU2wsJVGPQ=
Received: by 10.42.145.198 with SMTP id g6mr8651697icv.496.1302558334701;
	Mon, 11 Apr 2011 14:45:34 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id e9sm4461225ibb.49.2011.04.11.14.45.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Apr 2011 14:45:32 -0700 (PDT)
Date: Mon, 11 Apr 2011 14:45:50 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110411214550.GA16667@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
References: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-3-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-4-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-5-git-send-email-otavio@ossystems.com.br>
	<BANLkTikvUTiJSFKYAcD3X9tgFTwVu+X8Bg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTikvUTiJSFKYAcD3X9tgFTwVu+X8Bg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 4/6] xserver-xorg (1.9.4): enable xephyr
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
X-List-Received-Date: Mon, 11 Apr 2011 21:47:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (11/04/11 15:10), Martin Jansa wrote:
> |  'ephyrGetStill':
> | ephyrvideo.c:1243:1: internal compiler error: in
> default_secondary_reload, at targhooks.c:762
> | Please submit a full bug report,
> | with preprocessed source if appropriate.
> | See <http://gcc.gnu.org/bugs.html> for instructions.
> | make[4]: *** [ephyrvideo.lo] Error 1


another gcc ICE :( is it again in thumb mode ?
can you send me the preprocessed file for ephyrvideo.c

-Khem


