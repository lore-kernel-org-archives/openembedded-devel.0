Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RZ0A4-0000iU-7X
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 14:06:48 +0100
Received: by bkbzt4 with SMTP id zt4so2937738bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 04:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=XmQ5p+j0pkX7Qvu94voeSPnGEM8hQmA5ZKZB6j6aaW4=;
	b=gA2OiGoKS3CWYlK3tKRzNm1q5qzpW5L8IfDtbWWXu/zg580qVbYS2T4yJqA0/ugiyH
	BypEFkxKJtTi3X4MunpY2zCvtU08kdkY1X2ze3XiCUF76GtX5ncot8GnciINKFulGLz6
	IlQVvZoWU/dEbRaZADQRtor3EguyVx9xhnG2M=
Received: by 10.205.135.9 with SMTP id ie9mr3695373bkc.137.1323435597570;
	Fri, 09 Dec 2011 04:59:57 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id jf4sm9632233bkc.5.2011.12.09.04.59.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 04:59:55 -0800 (PST)
Message-ID: <4EE20646.2030300@googlemail.com>
Date: Fri, 09 Dec 2011 12:59:50 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EE17931.7000609@googlemail.com>
	<CABcZANn76DwH5QPkZw_zPVBHxS0F3a-7YgKebU3Hd=+CtZd+eQ@mail.gmail.com>
In-Reply-To: <CABcZANn76DwH5QPkZw_zPVBHxS0F3a-7YgKebU3Hd=+CtZd+eQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 09 Dec 2011 13:06:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


>> Is there a way I could force/select a particular version of a specific
>> package in a given target?
>>
>> I am building my fso-console-image and I would like it to use udev-165
>> instead of udev-162, but I can't find a way to alter this. I could build
>> udev-165 separately - no problem, but don't know how to integrate this into
>> the main task of building the image itself.
>>     
>
> PREFERRED_VERSION_udev = "165"
>
>   
>> Also, is there a way I can include additional packages as part of that
>> fso-console-image build? I'd like to have openvpn, a different version of
>> wpa_supplicant, openssl etc.
>>     
>
> IMAGE_INSTALL_append = " openvpn"
>   
Superb, thank you! One more query regarding this - how do I remove 
packages I do not want included in the final image? Is there a way to do 
that (fairly) easily?



