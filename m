Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tasskjapp@gmail.com>) id 1NAhGL-0002CW-Ns
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 10:55:48 +0100
Received: by bwz9 with SMTP id 9so913460bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 01:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=gKuFYZyOJ9S1ze3EawqJb8As9Nvg6NmBeddgh6NkFIU=;
	b=PAI4DqL1kQSXMgpr8UkKMBLiPiYS8iiTH9HHuQbtMUbMpHZL6f/tYtv/4FVYcL14q1
	4LxmoqB/tKDAOi51yN9ZU9MZAUY+uuVKx0oliQYVC/lZB0CeHI6W58blORcPF+srMGao
	muxlvqVrFfkykcFjbl6ZWmqxbLiSjtaBi45R4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=Y2G7FlqvQ6jt+WvfG2whShJRs3emJR/ASjjEamCB81GcQ0q+gcg7/9YxuuBoZMbfHC
	aoP0mwMdCZzl0nAhe+cH9YfIXMxlMnSdkDzmDKay5nMSQe3sK1lvBtVTBQS8s8l//cO6
	kvEybGB6srBDRpPuVwHzD14PhgyWhh1dW63mI=
Received: by 10.216.91.10 with SMTP id g10mr1197402wef.217.1258538061806;
	Wed, 18 Nov 2009 01:54:21 -0800 (PST)
Received: from ?192.168.0.47? (147.84-49-231.nextgentel.com [84.49.231.147])
	by mx.google.com with ESMTPS id 5sm922516eyf.0.2009.11.18.01.54.20
	(version=SSLv3 cipher=RC4-MD5); Wed, 18 Nov 2009 01:54:21 -0800 (PST)
Message-ID: <4B03C4DB.2020105@gmail.com>
Date: Wed, 18 Nov 2009 10:56:43 +0100
From: Tasslehoff <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.4pre) Gecko/20090915 Lightning/1.0pre Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ec7df6a60911180142j65980c0bnaf494f4c76fbe980@mail.gmail.com>
	<1258537737.25369.684.camel@lenovo.internal.reciva.com>
In-Reply-To: <1258537737.25369.684.camel@lenovo.internal.reciva.com>
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: tasskjapp@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Proposed patch for usb-gadget
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
X-List-Received-Date: Wed, 18 Nov 2009 09:55:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The only reason I did this was because setup_usb() doesn't use the 
argument at all, but uses $MODULE_OPTIONS directly.

Another fix is:

-               modprobe "$1" "$MODULE_OPTIONS"
+               modprobe $1 $2

and then remove quotes around all occurences of $MODULE_OPTIONS, but I 
like the first one better :)

- Tasslehoff


On 11/18/2009 10:48 AM, Phil Blundell wrote:
> On Wed, 2009-11-18 at 10:42 +0100, Tasslehoff Kjappfot wrote:
>    
>> usb-gadget failed when MODULE_OPTIONS contained more than one option. Here's
>> the patch I used to make it work.
>>      
> Thanks for the patch.  However, it seems to do two different things:
>
> -               modprobe "$1" "$MODULE_OPTIONS"
> +               modprobe "$1" $MODULE_OPTIONS
>
> I understand this bit, and it does seem reasonable since MODULE_OPTIONS
> might, as you say, contain multiple strings.
>
> -       networking)     setup_usb g_ether "$MODULE_OPTIONS" ;;
> -       zero)           setup_usb g_zero "$MODULE_OPTIONS" ;;
> -       midi)           setup_usb g_midi "$MODULE_OPTIONS" ;;
> -       printer)        setup_usb g_printer "$MODULE_OPTIONS" ;;
> -       gadgetfs)       setup_usb gadgetfs "$MODULE_OPTIONS" ;;
> -       composite)      setup_usb g_cdc "$MODULE_OPTIONS" ;;
> -       serial)         setup_usb g_serial "$MODULE_OPTIONS" ;;
> -       storage)        setup_usb g_file_storage "$MODULE_OPTIONS" ;;
> +       networking)     setup_usb g_ether ;;
> +       zero)           setup_usb g_zero ;;
> +       midi)           setup_usb g_midi ;;
> +       printer)        setup_usb g_printer ;;
> +       gadgetfs)       setup_usb gadgetfs ;;
> +       composite)      setup_usb g_cdc ;;
> +       serial)         setup_usb g_serial ;;
>
> But this part seems a bit strange.  Can you expand on why this is
> necessary and/or desirable?
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>    



