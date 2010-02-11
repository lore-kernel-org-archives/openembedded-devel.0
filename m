Received: from fg-out-1718.google.com ([72.14.220.157])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NfbcT-00067s-WC
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 17:10:25 +0100
Received: by fg-out-1718.google.com with SMTP id 22so384362fge.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 08:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=N8JpMneZCbqVUs/oCFnWooHclOj0KrPLLYIVVpFCR88=;
	b=jZb3SIslGOPSTSR7l7Avy2aaTG0sxoS/ZmU+axwtgCjkpfcUDhAQGn7tD7mHVQ2b49
	yhqAe4/wLMURjFjZrSUjNXnqVyJquvyKvcfhSKYf/YEJU1JufgGK6q2asaB4ogBCkqrc
	2V8sojZbs/9+VWxKzsUJng8wvUP/RzJwzzjy8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=efPQlkafftbfUH2FydLqLdmHn/tGThsIf9OiA900l97ZuzToXrGiQ3knMddT9Tsw+a
	OdfX4pDHhBOhYdHleQ0rb8DejS/RoDI+UXQLPtd6F6FwzeiuVllpUitSsPwcXtkmVqRW
	L4NYl8HFNT6JMxkViGfXRVaBUyNWi5uJJzWF4=
Received: by 10.87.76.6 with SMTP id d6mr536155fgl.71.1265904469426;
	Thu, 11 Feb 2010 08:07:49 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm1255455fxm.3.2010.02.11.08.07.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 11 Feb 2010 08:07:46 -0800 (PST)
Date: Thu, 11 Feb 2010 17:07:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100211160724.GB5364@jama>
References: <22B019BE-6BD8-4748-A263-54A1CB919CA4@vanille-media.de>
	<1265903466-22758-1-git-send-email-sledz@dresearch.de>
	<1265903466-22758-2-git-send-email-sledz@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <1265903466-22758-2-git-send-email-sledz@dresearch.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.157
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] vala-dbus-binding-tool: relocate native recipe from freesmartphone subdir
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
X-List-Received-Date: Thu, 11 Feb 2010 16:10:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 11, 2010 at 04:51:06PM +0100, Steffen Sledz wrote:
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> ---
>  .../vala-dbus-binding-tool-native_git.bb           |   10 ----------
>  .../vala-dbus-binding-tool-native_git.bb           |   10 ++++++++++
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  delete mode 100644 recipes/freesmartphone/vala-dbus-binding-tool-native_git.bb
>  create mode 100644 recipes/vala-dbus-binding-tool/vala-dbus-binding-tool-native_git.bb

Why not use that non-native package or at least that new .inc file or
ideally BBCLASSEXTENDS?

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


