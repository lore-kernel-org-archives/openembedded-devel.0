Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NDaht-0005HL-5C
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Nov 2009 10:32:12 +0100
Received: by bwz9 with SMTP id 9so363984bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Nov 2009 01:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=/QXBAXlgsU+6waFBtFYngbJDVe+egXuuexByKolA4Pg=;
	b=Is/cTShyudY/ih0RwXyBLL90Q7jnUZaol9NOOGiDNVefqvRMFEYdPF6PKjN4gyjpXG
	CcVoOaAKU5saca5ubDf6L1Px7VAe8jxp5WMcBsln25p64GSwHrSc4AJjIeHNFCEf5sFe
	yAx3m3FjrFWm2CXoTVyw2FCOTNecF1efPFVz4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=J1VWryB44/MHH+paQuZu9AcayxMKKG0609SElFlvWgtcSizjTVqTPOrKFi0CXvJiVU
	BQpcjZCc1A8D3OoG254rqK7wIHHZ+7Gwc4fSnqFk8/M8MFFHE9NyBEH7s1jYgrqJDUgd
	0zUNeEZR60K8c5cZNQ635Dpwkn7CPOWIwoa+w=
Received: by 10.204.48.131 with SMTP id r3mr2283057bkf.195.1259227838919;
	Thu, 26 Nov 2009 01:30:38 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm152791fxm.8.2009.11.26.01.30.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 26 Nov 2009 01:30:38 -0800 (PST)
Date: Thu, 26 Nov 2009 10:30:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091126093031.GA3354@jama>
References: <E1NDaYW-0003Fx-Nr@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1NDaYW-0003Fx-Nr@melo.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Steve Sakoman : gnome-mplayer: bump SRCREV
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
X-List-Received-Date: Thu, 26 Nov 2009 09:32:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 26, 2009 at 09:22:28AM +0000, git version control wrote:
> gnome-mplayer: bump SRCREV
> 
> ---
> 
>  recipes/gnome-mplayer/gnome-mplayer_svn.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/gnome-mplayer/gnome-mplayer_svn.bb b/recipes/gnome-mplayer/gnome-mplayer_svn.bb
> index 5540f94..2769bcb 100644
> --- a/recipes/gnome-mplayer/gnome-mplayer_svn.bb
> +++ b/recipes/gnome-mplayer/gnome-mplayer_svn.bb
> @@ -1,7 +1,7 @@
>  require gnome-mplayer.inc
>  
> -SRCREV = "1569"
> -PV = "0.9.8+svnr${SRCPV}"
> +SRCREV = "1583"
> +PV = "0.9.8+svn${SRCPV}"

Did you remove 'r' intentionally or is it a typo?

I was trying to make svnr consistent in OE tree and only few recipes
were using svn without 'r'
http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?id=6ca479d37af6d1e4e89e5dac0dc5b2fb81819c2b
if this isn't true:
* Should be safe as version svnr[1234567890]* > svn[1234567890]*
then I should fix more recipes

and if it is true then your srcrev bump won't be upgraded for people who
built gnome-mplayer between 6ca479d37af6d1e4e89e5dac0dc5b2fb81819c2b and
this change.

Cheers,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


