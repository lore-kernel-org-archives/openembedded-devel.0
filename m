Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RYqlV-0005G1-8p
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 04:04:49 +0100
Received: by wgbds11 with SMTP id ds11so3989316wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Dec 2011 18:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:subject:content-type:content-transfer-encoding;
	bh=/DMnwdhxkL7NGcYH0lTXdw14Jcj5kMvNbebY/x8HfPI=;
	b=NZZs1TmxUwpSt0X6K5NpJytkSaJlf9Qwp/moQ3Wh6CBbQodrP42l+QgLVA9itO5pJ6
	xMMF/gzIyzdsWI+dqa2XX/cYjhQO6FUpxmZQvqb+PZ+h10ne08KEFmxiV2Wt0EQOEZo5
	FQlft2XS8eeJy7ZjIOJdt6kVVIDewJziuLr3c=
Received: by 10.227.204.70 with SMTP id fl6mr5575422wbb.18.1323399478786;
	Thu, 08 Dec 2011 18:57:58 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id fg15sm11034693wbb.7.2011.12.08.18.57.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Dec 2011 18:57:57 -0800 (PST)
Message-ID: <4EE17931.7000609@googlemail.com>
Date: Fri, 09 Dec 2011 02:57:53 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: packages versioning
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
X-List-Received-Date: Fri, 09 Dec 2011 03:04:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Is there a way I could force/select a particular version of a specific 
package in a given target?

I am building my fso-console-image and I would like it to use udev-165 
instead of udev-162, but I can't find a way to alter this. I could build 
udev-165 separately - no problem, but don't know how to integrate this 
into the main task of building the image itself.

Also, is there a way I can include additional packages as part of that 
fso-console-image build? I'd like to have openvpn, a different version 
of wpa_supplicant, openssl etc.


