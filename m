Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elena.valhalla@gmail.com>) id 1LS7Ov-0007I6-8t
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jan 2009 11:12:05 +0100
Received: by an-out-0708.google.com with SMTP id d40so1702514and.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2009 02:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=73CXIc7oZdWumzEvGlQLI2Tedx3GhFftzOUDwMPcdq0=;
	b=tsM4vTEiflUFEasqyBb+pSr75gUHxoJhzPoVLUvZcMCTGW3x9kJmJ/jveydaBYP05N
	ArHRSsXNART6F0GugBm+NSuoTaklbnTN0J/J/9JSDGdQ21j0d8Ge+9m4vYcpiFSvA2pB
	7WML14xFZzwn/7GPfWitGFDjqb7TnBWALO9Yg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tooXlH/GYbnUm8j+Jhof6+cH9vRyEk4vFwtr1Bb7zH+XlxNkAFJsNbdum+lXEwpAZz
	XP6C/nh4Gu5zHJ/vicQKP70W8wD6PwdScODNno11if9BHcRAsfZ+bezvrrBdwKBJTibb
	0P79jUhCk7wowWpO/fIsAMZYtMDz1FccIGhqk=
MIME-Version: 1.0
Received: by 10.100.14.2 with SMTP id 2mr329483ann.13.1233137068923; Wed, 28 
	Jan 2009 02:04:28 -0800 (PST)
In-Reply-To: <1233136141.7444.3.camel@ubuntu2>
References: <1233059140.7818.4.camel@ubuntu2> <497F0D92.4040904@gmail.com>
	<1233136141.7444.3.camel@ubuntu2>
Date: Wed, 28 Jan 2009 11:04:28 +0100
Message-ID: <5c5e5c350901280204y4225d39cn3b4baf2d723ef879@mail.gmail.com>
From: Elena of Valhalla <elena.valhalla@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Build problems
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
X-List-Received-Date: Wed, 28 Jan 2009 10:12:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Wed, Jan 28, 2009 at 10:49 AM, Paolo Cremonese <pisa.t@teledata-i.com> wrote:
> Now, what I have to do to create a bootable compact flash with the
> image?

What image format did you build? I've found that the easier way to
create a bootable compact flash would be to build the .tar image,
format the CF as ext(2|3), extract the contents of the tarball in the
mounted CF and then install extlinux on it

-- 
Elena ``of Valhalla''

email: elena.valhalla@gmail.com


