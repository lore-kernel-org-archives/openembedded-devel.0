Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MApSz-00056H-0I
	for openembedded-devel@openembedded.org; Sun, 31 May 2009 20:09:05 +0200
Received: by yw-out-1718.google.com with SMTP id 5so3340945ywm.30
	for <openembedded-devel@openembedded.org>;
	Sun, 31 May 2009 11:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=tHsAn7tIQEuuz1xinsVMb/qzt2we3itJIIveK6L9d9A=;
	b=gctL1Xfsm9/FQS70rG8Ogx8qFaxfplQxVKx3nq/gduTOx3ftXErBW3n5XYtu8ulpY/
	a1rGglVQhWN7qot/4PULbZxY6L043gtGcLRGT9lloOBF3qDQERBoNPIsUGdcJol4CMJU
	USsMM4ybvVrPGrbbwA7cvcAWhvlq4R5K02+Nc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=nJ5CvD4HV6QYc/5NUofJlmn8BhCPk3BM3DcfUcwY/RFRBE3OfnI8ugSbwQOPX7cMT5
	sqWa5mdH2lZfW1aBbScGqhYGRLB9MHx7LbFsqVrfIHLZV3WsVrXalwWnjCGpACS0nNIf
	cKwOUqmHZguSLeixgBiOep1hVvnjdh5+aeFo8=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.12.17 with SMTP id 17mr6208182anl.2.1243792825501; Sun, 31 
	May 2009 11:00:25 -0700 (PDT)
In-Reply-To: <gvu149$nlk$1@ger.gmane.org>
References: <1243774077-19022-1-git-send-email-k.kooi@student.utwente.nl>
	<gvu149$nlk$1@ger.gmane.org>
Date: Sun, 31 May 2009 15:00:25 -0300
X-Google-Sender-Auth: 6343f9f32bb78c34
Message-ID: <be7a9f3d0905311100j91409d3n8011a9cffdba6fbc@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [STABLE][PATCH] xserver-common: add 1.24 from .dev
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
X-List-Received-Date: Sun, 31 May 2009 18:09:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Sun, May 31, 2009 at 10:36 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 31-05-09 14:47, Koen Kooi wrote:
>>
>> From: Koen Kooi<koen@openembedded.org>
>
> Grrrrr. git send-email stripped the comment again:
> * This makes xdg autostart applications autostart

I think it ought to be enabled; in case someone uses a session manager
(xfce-session, lxde-session or a own manager) it will reopen them.

I suggest it to have a /etc/defaults/xserver-common that makes it optional.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


