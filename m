Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P3VKg-0007ta-3X
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 16:51:03 +0200
Received: by bwz7 with SMTP id 7so42276bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 07:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=5Jl0hUE7MeyOHknTShgfbkdErDe5AKscpGLHWUpZTMU=;
	b=MKmNnrGiThJoH1kHlkc9Dk3aAQA/5NJTSPzZBUds/rqFmNI+Zdj9VrEYgktD0urlT6
	lJvVisofprJ/4ARmfj6GcpZifYnFbBAS15RqOaI/+/Adjk5GyLLhCGjyd8DjBrdJR2cD
	hsARQO5bbsmz5EqPscEFvKmd6YnWz6EkOhheQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Qyp8bMsiXYnKH0svRsboWNnhNjnx+8EcWLX+PQmWgV+9q8taFJI4iI1rpOe7cQQt9/
	IgzCXopoCPp5rhY1i5n3fgH9wffEpJZIqd6vdkVucaRdaCJGl/WXTdyCFyhnGr0vO0O/
	dH7YlJKtqzJI283z4cTEdIV6ZXVk4siY7URG4=
Received: by 10.204.80.98 with SMTP id s34mr9656189bkk.211.1286376643945;
	Wed, 06 Oct 2010 07:50:43 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 11sm737030bkj.11.2010.10.06.07.50.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 06 Oct 2010 07:50:43 -0700 (PDT)
Date: Wed, 6 Oct 2010 16:50:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101006145051.GK3264@jama>
References: <4CAC8B19.9050502@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4CAC8B19.9050502@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: /usr/bin/fop ???
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
X-List-Received-Date: Wed, 06 Oct 2010 14:51:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 06, 2010 at 03:43:37PM +0100, Arigead wrote:
> trying to "bitbake tangogps" and getting errors about /usr/bin/fop
> 
> I'm searching for a solution but not getting too far with that. I'm not
> sure why and embedded verison of tangogps would require Apache FOP but
> I'm on the wrong end of a learning curve.
> 
> Cheers for any pointers which would get me over this hurdle.

what about providing whole log.do_compile and log.do_configure to be
sure which recipe has this problem (I see libx11 in log, but you're
talking about tangogps).

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


