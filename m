Received: from qmta13.westchester.pa.mail.comcast.net ([76.96.59.243])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1NrcGE-0006Og-NA
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 20:17:08 +0100
Received: from omta23.westchester.pa.mail.comcast.net ([76.96.62.74])
	by qmta13.westchester.pa.mail.comcast.net with comcast
	id tpXt1d0061c6gX85DvCzRk; Tue, 16 Mar 2010 19:12:59 +0000
Received: from [192.168.1.100] ([173.13.189.149])
	by omta23.westchester.pa.mail.comcast.net with comcast
	id tvFs1d0023DqXwV3jvFs6Q; Tue, 16 Mar 2010 19:15:52 +0000
Message-ID: <4B9FD838.5090208@comcast.net>
Date: Tue, 16 Mar 2010 12:12:56 -0700
From: Ed Nelson <enelson1000@comcast.net>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1268511676.24057.12.camel@ed-hp-laptop>
	<4B9FC5D6.8000701@slashdev.ca>
In-Reply-To: <4B9FC5D6.8000701@slashdev.ca>
X-SA-Exim-Connect-IP: 76.96.59.243
X-SA-Exim-Mail-From: enelson1000@comcast.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Tue, 16 Mar 2010 19:17:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Josh Kropf wrote:
> ed,
>
> Are you able to use the python interactive shell on your mini2440? I 
> had a similar problem in that python would fail to even start 
> (resulting in an alignment trap).
>
> For me simply removing /usr/lib/python2.6/lib-dynload/readline.so kept 
> python from dying on startup.
>
> On 03/13/2010 03:21 PM, ed wrote:
>> I am trying to run a simple hello button python program using pygtk.
>>
>> I have built a minimal-gpe-image for the mini2440.
>>
>> But when I try and run the helloworld.py from the Pygtk tutorial.
>>
>> =========================================================
>>
>> #!/usr/bin/env python
>>
>> # example helloworld.py
>>
>> import pygtk
>> pygtk.require('2.0')
>> import gtk
>>
>> class HelloWorld:
>>
>>      # This is a callback function. The data arguments are ignored
>>      # in this example. More on callbacks below.
>>      def hello(self, widget, data=None):
>>          print "Hello World"
>>
>>      def delete_event(self, widget, event, data=None):
>>          # If you return FALSE in the "delete_event" signal handler,
>>          # GTK will emit the "destroy" signal. Returning TRUE means
>>          # you don't want the window to be destroyed.
>>          # This is useful for popping up 'are you sure you want to 
>> quit?'
>>          # type dialogs.
>>          print "delete event occurred"
>>
>>          # Change FALSE to TRUE and the main window will not be 
>> destroyed
>>          # with a "delete_event".
>>          return False
>>
>>      def destroy(self, widget, data=None):
>>          print "destroy signal occurred"
>>          gtk.main_quit()
>>
>>      def __init__(self):
>>          # create a new window
>>          self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
>>
>>          # When the window is given the "delete_event" signal (this is
>> given
>>          # by the window manager, usually by the "close" option, or on
>> the
>>          # titlebar), we ask it to call the delete_event () function
>>          # as defined above. The data passed to the callback
>>          # function is NULL and is ignored in the callback function.
>>          self.window.connect("delete_event", self.delete_event)
>>
>>          # Here we connect the "destroy" event to a signal handler.
>>          # This event occurs when we call gtk_widget_destroy() on the
>> window,
>>          # or if we return FALSE in the "delete_event" callback.
>>          self.window.connect("destroy", self.destroy)
>>
>>          # Sets the border width of the window.
>>          self.window.set_border_width(10)
>>
>>          # Creates a new button with the label "Hello World".
>>          self.button = gtk.Button("Hello World")
>>
>>          # When the button receives the "clicked" signal, it will call
>> the
>>          # function hello() passing it None as its argument.  The 
>> hello()
>>          # function is defined above.
>>          self.button.connect("clicked", self.hello, None)
>>
>>          # This will cause the window to be destroyed by calling
>>          # gtk_widget_destroy(window) when "clicked".  Again, the 
>> destroy
>>          # signal could come from here, or the window manager.
>>          self.button.connect_object("clicked", gtk.Widget.destroy,
>> self.window)
>>
>>          # This packs the button into the window (a GTK container).
>>          self.window.add(self.button)
>>
>>          # The final step is to display this newly created widget.
>>          self.button.show()
>>
>>          # and the window
>>          self.window.show()
>>
>>      def main(self):
>>          # All PyGTK applications must have a gtk.main(). Control ends
>> here
>>          # and waits for an event to occur (like a key press or mouse
>> event).
>>          gtk.main()
>>
>> # If the program is run directly or passed as an argument to the python
>> # interpreter then create a HelloWorld instance and show it
>> if __name__ == "__main__":
>>      hello = HelloWorld()
>>      hello.main()
>>
>> ==============================================================
>>
>> I get the follow error when I run
>> #python -v pygtkHelloWorld.py
>>
>> # /usr/lib/python2.6/site-packages/gtk-2.0/gtk/_lazyutils.pyo
>> matches /usr/lib/python2.6/site-packages/gtk-2.0/gtk/_lazyutils.py
>> import gtk._lazyutils # precompiled
>> from /usr/lib/python2.6/site-packages/gtk-2.0/gtk/_lazyutils.pyo
>> # /usr/lib/python2.6/site-packages/gtk-2.0/gtk/deprecation.pyo
>> matches /usr/lib/python2.6/site-packages/gtk-2.0/gtk/deprecation.py
>> import gtk.deprecation # precompiled
>> from /usr/lib/python2.6/site-packages/gtk-2.0/gtk/deprecation.pyo
>> Alignment trap: python (2412) PC=0x40bfa3c4 Instr=0x280069c0
>> Address=0xffffffff FSR 0x813
>> Segmentation fault
>>
>>
>> Does anyone have any ideas why it chokes at deprecation.pyo?????
>>
>> Thanks
>> Ed
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>    
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


I can run python programs but can't run pygtk programs. 
When I use the python interactive shell I get the Alignment trap then 
Segment fault when I try and import gtk which is what the 
deprecation.pyo is doing.

 >>>import gtk

Alignment trap
Segment fault.


