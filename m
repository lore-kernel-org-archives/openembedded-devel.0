Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thoughtmonster@gmail.com>) id 1NBQAQ-0003wU-I1
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 10:52:41 +0100
Received: by fxm1 with SMTP id 1so3266661fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 01:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=NwhDDhaI5P+T3JVL8Ss7n+G7wzIHDE5oMk50qon3BtM=;
	b=tSRwo6o+VAMHHOFZ4vt4maBH5HLkjVvgz13jjgQxk4nbFhD59isy26evX8UAdji8mT
	b8xWO+B55+b8r7N1NjKHQrabx09nkW5KQWQVunn43qIL5473lf95k+kJW7iaKkU9sZMu
	jxmbzihZEXAyCP9IM09v2Dcdev2wzaEuc0bpg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=u5FLhRNU2vCLkH9fl9ZhpN+B12uqpbx1Ml+HG+/2bp3VOI+UG2BX5OnOKQDf+u6RqS
	EVtd9GGx1Q0CnNbkdKn1yUHL9zkD14Jqq+Mh7X3JsAy2mbf3EKJ6/opFHrH9FiAR8L3h
	jaS78MhvEQ59EfyqrbRglGgyRj2YLCF5KnUNA=
MIME-Version: 1.0
Received: by 10.239.143.212 with SMTP id l20mr116250hba.210.1258710673279; 
	Fri, 20 Nov 2009 01:51:13 -0800 (PST)
In-Reply-To: <he5n72$ltj$1@ger.gmane.org>
References: <992df8520911150534v4aeec248u91c5ca477de25eb9@mail.gmail.com>
	<he5n72$ltj$1@ger.gmane.org>
Date: Fri, 20 Nov 2009 11:51:13 +0200
Message-ID: <992df8520911200151q57520791n6395642f5bc18e@mail.gmail.com>
From: Alex Ferguson <thoughtmonster@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: thoughtmonster@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Initial Support for the Samsung Omnia (SGH-i900)
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
X-List-Received-Date: Fri, 20 Nov 2009 09:52:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 20, 2009 at 11:23 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

>
> Could you please explain why the default tslib.sh isn't working for you?


Because it doesn't? /dev/input/touchscreenX doesn't exist. The devices
/dev/input/event0 and /dev/input/event1 are consistently assigned to
keyboard and touchscreen, respectively, and I'm having no problem with that.

Support for the SGH-i900 in the kernel isn't perfect yet. There is still a
lot of work to be done, and a lot of drivers are missing or incomplete. It
boots, touchscreen works, wifi works, but that's about it.

Once the drivers are improved and the need for a custom tslib.sh file
evaporates, I'll be sure to open a bug report.

Thanks.

