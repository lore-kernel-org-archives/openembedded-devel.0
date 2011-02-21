Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PrbTQ-0006wZ-8f
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Feb 2011 20:31:08 +0100
Received: by iwn10 with SMTP id 10so2334073iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Feb 2011 11:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=UDMlE5aVBilNBiVzSvsBaCTrNR3gz0/E7SIDoH2M3Z0=;
	b=a/qKJXQ+0fjMxSYvIFE9uz85R+tnnnujOv8yk7PTrGTbqOjoal+m6ayz2kkCva5Ugq
	9ynkAq1TWE9nEkRqsFhyc5e7r0YnDc2m7ODPl60XfvJ8bqouGD6PVcvjcitYx6VUtIa3
	Tb/Gzs2IQx3oR2117pJEgoSh9I4hfW75aaH3A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=n8VdcORaDVLwHU6hRXhl6kY6mq3pDovCfRIQyUKYyO5FReZStd1a0IyXkfFDHgGz9v
	syKgJVHgaDJyEceEO/PwvZwD5nr/ufE0hgbY1wVlC7R1Q2VSOZtDccQojdv5Z4PKP2Ju
	3gNIGJqALFUzPS7igGjMEJ//Mau83OqfCU6OQ=
Received: by 10.42.230.72 with SMTP id jl8mr2389417icb.369.1298316588099;
	Mon, 21 Feb 2011 11:29:48 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id t14sm4470966icd.10.2011.02.21.11.29.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Feb 2011 11:29:47 -0800 (PST)
Date: Mon, 21 Feb 2011 11:29:55 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110221192955.GF10070@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=rTuT81+QVpNo4oL_J53nKbs5tnEh+=asqgE6a@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=rTuT81+QVpNo4oL_J53nKbs5tnEh+=asqgE6a@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: minimal-image starts dragging in GTK
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
X-List-Received-Date: Mon, 21 Feb 2011 19:31:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (21/02/11 18:53), Leon Woestenberg wrote:
> Hello all,
> 
> 
> since recently, minimal-image starts dragging in GTK. I have tracked
> it down to this commit:
> 
> avahi: integrate python into main recipe
> * this doesn't introduce spurious rdepends like enabling gtk did in the past
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> 
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=70e46e545095a2b2dac634d484eb1c331a1bff34
> 
> 
> This seems a hard-dependency, indepent of "+AVAHI_GTK ?= "-disable-gtk""
> 
> +RDEPENDS_avahi-discover = "python-avahi python-pygtk"
> 
> 
> Is that intended?

I have been thinking of doing a time to time scan of .dot files
and check the dependencies and skin down the useless dependencies


> 
> Regards,
> -- 
> Leon
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


