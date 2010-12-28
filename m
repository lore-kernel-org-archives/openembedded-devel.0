Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PXPeQ-0007Y7-Lq
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Dec 2010 03:51:06 +0100
Received: by pvd12 with SMTP id 12so1780966pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Dec 2010 18:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=DXU2vp8jHf+2do8AdWrHkouQsOiMcUCqfjxHWutJs5Y=;
	b=i7pqqeUHDWK9a+i+122RABA3shjY2tm4qszV7590ertZUsoeSASbCBkd/eeDB9HWQ+
	oaIKeirgyJ4vixrtIjQQD2Qf/oDTR1aazjkOq5gyyEcOUCLhoaX319KsmJWl9n797vd4
	b3qmSKIVGO3klLwh5kD4cYwE7/yYRMI+dunLw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=NPK+w9uwEO8ZYlPAGcY0DQXTqWVWhidWzBc7fIyeR77W44xvzqxp7r+TDMbNZ3y3RT
	VeJBv3XIe+svKpVRtg1bTtIvHj7+ZSb6oxbM6WJuFJ6AsofNoAZFkACNyWh7rMsPFxTR
	FGOI5dWCozMgpFexjvtLr/mUVLCDIJpKXMuaU=
Received: by 10.142.114.5 with SMTP id m5mr10429277wfc.237.1293504536752;
	Mon, 27 Dec 2010 18:48:56 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x35sm18568130wfd.13.2010.12.27.18.48.55
	(version=SSLv3 cipher=RC4-MD5); Mon, 27 Dec 2010 18:48:55 -0800 (PST)
Message-ID: <4D195014.9060802@gmail.com>
Date: Mon, 27 Dec 2010 18:48:52 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293476385-7289-1-git-send-email-bgamari.foss@gmail.com>
In-Reply-To: <1293476385-7289-1-git-send-email-bgamari.foss@gmail.com>
Subject: Re: Python 2.7.1 support
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
X-List-Received-Date: Tue, 28 Dec 2010 02:51:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/27/2010 10:59 AM, Ben Gamari wrote:
>
> I spent a few hours over the last few days forward porting the python 2.6
> recipes to 2.7.1. At this point I can build both python-native and python on
> for my ARM target. I don't have time or access to hardware at the moment so I
> can't test the produce binaries but I figured I'd send this out in the name of
> release early, release often.

Thank you for the intent of contribution

>
> If someone has the time and inclination to test this, I'm sure it would be
> appreciated. I believe the 2.7 series should be API compatible with 2.6, so all
> of the existing extensions should work unmodified. Are there any other barriers
> to merging that I haven't thought of?

python is used quite a bit. So I would be more at peace if it was tested 
on more than one platforms before we sort of use it. But sending out 
them to ml is always good.

>
> Has anyone thought about how we are going to handle python 2/3 coexistence? Or,
> even better, has anyone looked into putting together some recipes?

We are a bit far from python 3 but eventually we have to make it coexist 
with 2.x

>
> Cheers,
>
> - Ben
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



