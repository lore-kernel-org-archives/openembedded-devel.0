Received: from mail-oa0-f42.google.com ([209.85.219.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UM4Fb-0004GP-DT
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Mar 2013 23:27:51 +0100
Received: by mail-oa0-f42.google.com with SMTP id i18so1191258oag.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Mar 2013 15:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=lZMVr4mip/9S65IVEZujEyhAD3T7CALMR7tKa5s+YDk=;
	b=xQlqjjqFiT3MgXog/1O86Wx1qV0F9fDJqh/zPvkBRbAS7pz8g5CG6mhX0B7WEPRugK
	X2ontU29umGeWcn4qt/f/MIkEsXI+u/cj9f1t3jhOmXOHHOZU+rckpVxcbx14IeJ/j7h
	w5e6MjP22QrapssCzOWJMafZGKg5wfai6Ol4FfeDCY1WINdDo+COKmsXLV4DCC1xNl5X
	cDEMoYPaC+1Jg9eSPqjK+qzVNeGn9WZVapW+BEYjL4ZXbQf5ciUIVoKI7l9aYEzAnEHA
	i+Q3RSVBnKTVi26Qmu2FmGIuEHyjX47GAo4mbdgVMRTF8ZNlS3EG8rU3uFjRd9XRsY2B
	MuAg==
MIME-Version: 1.0
X-Received: by 10.182.39.69 with SMTP id n5mr2430738obk.72.1364681444377; Sat,
	30 Mar 2013 15:10:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Sat, 30 Mar 2013 15:10:44 -0700 (PDT)
In-Reply-To: <51574B7B.1030204@pseudoterminal.org>
References: <5156FDFD.1030606@pseudoterminal.org>
	<CAP9ODKr2wE7ZCr-2U=HWZ5KD0ywrmkGJtA_8f_PLsUghe_SEHw@mail.gmail.com>
	<51574B7B.1030204@pseudoterminal.org>
Date: Sat, 30 Mar 2013 19:10:44 -0300
X-Google-Sender-Auth: NBpJngmdIyQzDD-ROmrPeO209M8
Message-ID: <CAP9ODKoPjaB2bbWV1MX+8N234w-tzJLNJSX1fXxJQ0nc42H7Vg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: gst-ffmpeg configure-fix patch and yasm
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
X-List-Received-Date: Sat, 30 Mar 2013 22:27:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Sat, Mar 30, 2013 at 5:30 PM, dv <dv@pseudoterminal.org> wrote:
> On 03/30/13 17:40, Otavio Salvador wrote:
>>
>> On Sat, Mar 30, 2013 at 12:00 PM, dv <dv@pseudoterminal.org> wrote:
>>>
>>> Hello,
>>>
>>> I noticed this part of the configure-fix.patch file for gst-ffmpeg
>>> 0.10.13:
>>>
>>> +  if test "x$disable_yasm" != "xyes"; then
>>> +    embffmpeg_configure_args="$embffmpeg_configure_args --disable-yasm"
>>> +  fi
>>>
>>> Shouldn't the test be:  if test "x$disable_yasm" = "xyes"  ?
>>> To me, it seems as if this code adds --disable-yasm if disable_yasm is
>>> not
>>> set to "yes", which is the complete opposite of the intended behavior.
>>>
>>> Or am I missing some detail about shell script code here?
>>
>> I think you are right here. Maybe you could provide a fix for it?
...
> No problem. Patch for the patch attached :)

Please Martin,

Can you review the patch in this thread?

Regards,

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


