Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <kergoth@gmail.com>) id 1IpzKD-0000Hz-Pk
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Nov 2007 05:49:05 +0100
Received: by an-out-0708.google.com with SMTP id c38so3503ana
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2007 20:48:09 -0800 (PST)
Received: by 10.142.229.4 with SMTP id b4mr8308wfh.1194493508654;
	Wed, 07 Nov 2007 19:45:08 -0800 (PST)
Received: by 10.142.104.18 with HTTP; Wed, 7 Nov 2007 19:45:03 -0800 (PST)
Message-ID: <b6ebd0a50711071945ye0413b8rbae1f933b63903cf@mail.gmail.com>
Date: Wed, 7 Nov 2007 20:45:03 -0700
From: "Chris Larson" <clarson@kergoth.com>
Sender: kergoth@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20071107195845.GA1583@lenovo>
MIME-Version: 1.0
References: <20071107195845.GA1583@lenovo>
X-Google-Sender-Auth: 6f93a2ac7eb5e0fd
Subject: Re: naming tasks
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Nov 2007 04:49:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

"EXPORT_FUNCTIONS do_patch" in patch.bbclass just makes do_patch ->
patch_do_patch.  That way you can override the do_patch function and
call back to the patch.bbclass do_patch (patch_do_patch) manually if
need be, but if you don't, do_patch is still defined.
EXPORT_FUNCTIONS was just a convenience.

On Nov 7, 2007 12:58 PM, David Farning <dfarning@gmail.com> wrote:
> Still working on the manual!
>
> I've come across a question on how tasks are named.  What is the
> purpose of the prefix patch in the def patch_do_patch found in
> the patch class?  Most task seems to be called do_taskname.
> I am thinking that it has something to do with
> scope but I am unsure.
>
> addtask refers to do_patch and
> EXPORT_FUNCTIONS refers to do_patch
>
> Thanks
> David
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Chris Larson - clarson at kergoth dot com
Dedicated Engineer - MontaVista - clarson at mvista dot com
Core Developer/Architect - TSLib, BitBake, OpenEmbedded, OpenZaurus


