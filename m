Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NAhBA-00022A-0B
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 10:50:27 +0100
Received: from [85.210.2.237] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NAh9o-0008PD-2L
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 09:49:00 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ec7df6a60911180142j65980c0bnaf494f4c76fbe980@mail.gmail.com>
References: <ec7df6a60911180142j65980c0bnaf494f4c76fbe980@mail.gmail.com>
Date: Wed, 18 Nov 2009 09:48:57 +0000
Message-ID: <1258537737.25369.684.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.2.237
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
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
X-List-Received-Date: Wed, 18 Nov 2009 09:50:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-18 at 10:42 +0100, Tasslehoff Kjappfot wrote:
> usb-gadget failed when MODULE_OPTIONS contained more than one option. Here's
> the patch I used to make it work.

Thanks for the patch.  However, it seems to do two different things:

-               modprobe "$1" "$MODULE_OPTIONS"
+               modprobe "$1" $MODULE_OPTIONS

I understand this bit, and it does seem reasonable since MODULE_OPTIONS
might, as you say, contain multiple strings.

-       networking)     setup_usb g_ether "$MODULE_OPTIONS" ;;
-       zero)           setup_usb g_zero "$MODULE_OPTIONS" ;;
-       midi)           setup_usb g_midi "$MODULE_OPTIONS" ;;
-       printer)        setup_usb g_printer "$MODULE_OPTIONS" ;;
-       gadgetfs)       setup_usb gadgetfs "$MODULE_OPTIONS" ;;
-       composite)      setup_usb g_cdc "$MODULE_OPTIONS" ;;
-       serial)         setup_usb g_serial "$MODULE_OPTIONS" ;;
-       storage)        setup_usb g_file_storage "$MODULE_OPTIONS" ;;
+       networking)     setup_usb g_ether ;;
+       zero)           setup_usb g_zero ;;
+       midi)           setup_usb g_midi ;;
+       printer)        setup_usb g_printer ;;
+       gadgetfs)       setup_usb gadgetfs ;;
+       composite)      setup_usb g_cdc ;;
+       serial)         setup_usb g_serial ;;

But this part seems a bit strange.  Can you expand on why this is
necessary and/or desirable?

p.




