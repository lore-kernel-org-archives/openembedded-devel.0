Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 49F536F477
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Mar 2014 20:19:04 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id f11so2071182qae.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Mar 2014 12:19:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6TGMf9szKbNLNMuW96HmEXsQJgLRk3YDG0QcNUDXGlY=;
	b=Gy7zg9TkXaldVdJDiDk8073+w4iqcYy4PRE7GPBl19YyTHdjs03fAvadCUR0fVR3zA
	P8VbiQqz21KJFb6iLxQWC/hE4slAcM4cInacbKjD81J4u7jwSiQjlUE+AKJAbfsWWZVe
	9DJtmttagI8h/y2AQYtStCf8GuWynAuVGbKQErwIXUeY9zCqGxIATz+NyA8cFAB0HAhy
	5Ol9eyaX6oB8bIxOsE91jDeaI2+CyNUy8okkd6kuaD6KK3JijuGUJ5Dh4XgxcMDwf/8j
	75Y2/Sou7XUV4B4hqHKMqwL5VW2qzgdmvehUk9OLAry3zt3Dt22hJwSYIKf6abUaBuer
	1IBA==
X-Gm-Message-State: ALoCoQmFY62+UmtJPkfVZpgyledrZ4IF7kK7Pd+omL+U57rEiPOIRJtITMuUdOxvzxe2jJJkNX2w
X-Received: by 10.140.106.225 with SMTP id e88mr12439211qgf.66.1393705145081; 
	Sat, 01 Mar 2014 12:19:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Sat, 1 Mar 2014 12:18:44 -0800 (PST)
In-Reply-To: <5362182.lGPryEyDJx@peggleto-mobl5.ger.corp.intel.com>
References: <1369981125-9597-1-git-send-email-xufeng.zhang@windriver.com>
	<53103D8E.4070105@windriver.com>
	<CAOLEWZWHfoUz0c+GW+MFqx-u=9NM9VJnANAB6YP9Wh56grtEaA@mail.gmail.com>
	<5362182.lGPryEyDJx@peggleto-mobl5.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 1 Mar 2014 20:18:44 +0000
Message-ID: <CAJTo0LbSeFKkk0JrEYQAS3Lb2NVAJYuraaBAkNCgT_-LUW+Gdw@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-devel] [PATCH] ntp: Resolve some abnormal behaviors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Mar 2014 20:19:05 -0000
Content-Type: text/plain; charset=UTF-8

On 1 March 2014 09:59, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> That would be nice, but since you can't actually distribute a product that
> connects to the main pool.ntp.org server (you need to register your own NTP
> pool [1]) we've elected not to set any default so that you are encouraged to
> do the right thing and explicitly set your own.

We should probably put this in the documentation.  I'll file a bug.

Ross

