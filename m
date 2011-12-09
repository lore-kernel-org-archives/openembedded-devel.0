Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RZ2xo-00072X-84
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 17:06:20 +0100
Received: by faaa20 with SMTP id a20so854230faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 07:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ZDR2fyXizLt2QD9A447tBEprrV+MfOOebDN+xcdv+6I=;
	b=TpvY7ELRsoo11pdbcLMm3WWBWWFubbfvmxNUXClWVX1ht59tzhfPpaJRx+dqL1nKbo
	ti4XQk5ivnEg6Ff/YQ1P76EqXY7vW8gbD/jyCey1ZcepsiAO7dNuDwhhbaz/ZCM0EU/C
	IFzNvzXpDogiq8zFfFmnJqdzCO5iiyB5GEsVs=
Received: by 10.180.94.71 with SMTP id da7mr11272000wib.29.1323446369421;
	Fri, 09 Dec 2011 07:59:29 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id fi11sm12943874wbb.9.2011.12.09.07.59.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 07:59:28 -0800 (PST)
Message-ID: <4EE2305B.5030407@googlemail.com>
Date: Fri, 09 Dec 2011 15:59:23 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EE17931.7000609@googlemail.com>	<CABcZANn76DwH5QPkZw_zPVBHxS0F3a-7YgKebU3Hd=+CtZd+eQ@mail.gmail.com>	<4EE20646.2030300@googlemail.com>
	<jbt2rc$l31$1@dough.gmane.org>
In-Reply-To: <jbt2rc$l31$1@dough.gmane.org>
Subject: Re: packages versioning
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
X-List-Received-Date: Fri, 09 Dec 2011 16:06:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


>> One more query regarding this - how do I remove
>> packages I do not want included in the final image? Is there a way to do
>> that (fairly) easily?
>>     
>
> Yes, create your own image recipe.
>   
I was hoping that there is an easier option ("(fairly) easily" being the 
keywords here)!

I tried to trace where these packages are derived from, but could not 
find anything. For example, I'd like to remove ash (and possibly the 
whole BusyBox setup) and replace it with bash and their package 
equivalents. By looking at the tasks/ as well as images/ directories I 
couldn't find where these packages are derived from, hence the above 
question.


