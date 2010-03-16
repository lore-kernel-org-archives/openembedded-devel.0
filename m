Received: from ironport2-out.teksavvy.com ([206.248.154.183]
	helo=ironport2-out.pppoe.ca) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <josh@slashdev.ca>) id 1Nras2-0005um-N2
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 18:48:05 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApEBAEhgn0tFpZDY/2dsb2JhbAAH1WWEeASGGYR3
X-IronPort-AV: E=Sophos;i="4.49,651,1262581200"; d="scan'208";a="58348002"
Received: from 69-165-144-216.dsl.teksavvy.com (HELO [192.168.1.10])
	([69.165.144.216])
	by ironport2-out.pppoe.ca with ESMTP; 16 Mar 2010 13:44:53 -0400
Message-ID: <4B9FC5D6.8000701@slashdev.ca>
Date: Tue, 16 Mar 2010 13:54:30 -0400
From: Josh Kropf <josh@slashdev.ca>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8) Gecko/20100301 Shredder/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1268511676.24057.12.camel@ed-hp-laptop>
In-Reply-To: <1268511676.24057.12.camel@ed-hp-laptop>
X-SA-Exim-Connect-IP: 206.248.154.183
X-SA-Exim-Mail-From: josh@slashdev.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Alignment trap - deprecation.pyo
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
X-List-Received-Date: Tue, 16 Mar 2010 17:48:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

ed,

Are you able to use the python interactive shell on your mini2440? I had 
a similar problem in that python would fail to even start (resulting in 
an alignment trap).

For me simply removing /usr/lib/python2.6/lib-dynload/readline.so kept 
python from dying on startup.

On 03/13/2010 03:21 PM, ed wrote:
> I am trying to run a simple hello button python program using pygtk.
>
> I have built a minimal-gpe-image for the mini2440.
>
> But when I try and run the helloworld.py from the Pygtk tutorial.
>
> =========================================================
>
> #!/usr/bin/env python
>
> # example helloworld.py
>
> import pygtk
> pygtk.require('2.0')
> import gtk
>
> class HelloWorld:
>
>      # This is a callback function. The data arguments are ignored
>      # in this example. More on callbacks below.
>      def hello(self, widget, data=None):
>          print "Hello World"
>
>      def delete_event(self, widget, event, data=None):
>          # If you return FALSE in the "delete_event" signal handler,
>          # GTK will emit the "destroy" signal. Returning TRUE means
>          # you don't want the window to be destroyed.
>          # This is useful for popping up 'are you sure you want to quit?'
>          # type dialogs.
>          print "delete event occurred"
>
>          # Change FALSE to TRUE and the main window will not be destroyed
>          # with a "delete_event".
>          return False
>
>      def destroy(self, widget, data=None):
>          print "destroy signal occurred"
>          gtk.main_quit()
>
>      def __init__(self):
>          # create a new window
>          self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
>
>          # When the window is given the "delete_event" signal (this is
> given
>          # by the window manager, usually by the "close" option, or on
> the
>          # titlebar), we ask it to call the delete_event () function
>          # as defined above. The data passed to the callback
>          # function is NULL and is ignored in the callback function.
>          self.window.connect("delete_event", self.delete_event)
>
>          # Here we connect the "destroy" event to a signal handler.
>          # This event occurs when we call gtk_widget_destroy() on the
> window,
>          # or if we return FALSE in the "delete_event" callback.
>          self.window.connect("destroy", self.destroy)
>
>          # Sets the border width of the window.
>          self.window.set_border_width(10)
>
>          # Creates a new button with the label "Hello World".
>          self.button = gtk.Button("Hello World")
>
>          # When the button receives the "clicked" signal, it will call
> the
>          # function hello() passing it None as its argument.  The hello()
>          # function is defined above.
>          self.button.connect("clicked", self.hello, None)
>
>          # This will cause the window to be destroyed by calling
>          # gtk_widget_destroy(window) when "clicked".  Again, the destroy
>          # signal could come from here, or the window manager.
>          self.button.connect_object("clicked", gtk.Widget.destroy,
> self.window)
>
>          # This packs the button into the window (a GTK container).
>          self.window.add(self.button)
>
>          # The final step is to display this newly created widget.
>          self.button.show()
>
>          # and the window
>          self.window.show()
>
>      def main(self):
>          # All PyGTK applications must have a gtk.main(). Control ends
> here
>          # and waits for an event to occur (like a key press or mouse
> event).
>          gtk.main()
>
> # If the program is run directly or passed as an argument to the python
> # interpreter then create a HelloWorld instance and show it
> if __name__ == "__main__":
>      hello = HelloWorld()
>      hello.main()
>
> ==============================================================
>
> I get the follow error when I run
> #python -v pygtkHelloWorld.py
>
> # /usr/lib/python2.6/site-packages/gtk-2.0/gtk/_lazyutils.pyo
> matches /usr/lib/python2.6/site-packages/gtk-2.0/gtk/_lazyutils.py
> import gtk._lazyutils # precompiled
> from /usr/lib/python2.6/site-packages/gtk-2.0/gtk/_lazyutils.pyo
> # /usr/lib/python2.6/site-packages/gtk-2.0/gtk/deprecation.pyo
> matches /usr/lib/python2.6/site-packages/gtk-2.0/gtk/deprecation.py
> import gtk.deprecation # precompiled
> from /usr/lib/python2.6/site-packages/gtk-2.0/gtk/deprecation.pyo
> Alignment trap: python (2412) PC=0x40bfa3c4 Instr=0x280069c0
> Address=0xffffffff FSR 0x813
> Segmentation fault
>
>
> Does anyone have any ideas why it chokes at deprecation.pyo?????
>
> Thanks
> Ed
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>    


