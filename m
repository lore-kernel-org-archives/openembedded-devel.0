Received: from qmta09.emeryville.ca.mail.comcast.net ([76.96.30.96])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1NqXsh-0001AL-Tj
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 21:24:25 +0100
Received: from omta02.emeryville.ca.mail.comcast.net ([76.96.30.19])
	by qmta09.emeryville.ca.mail.comcast.net with comcast
	id skKh1d0030QkzPwA9kMKop; Sat, 13 Mar 2010 20:21:19 +0000
Received: from [192.168.1.106] ([173.13.189.149])
	by omta02.emeryville.ca.mail.comcast.net with comcast
	id skMJ1d0073DqXwV8NkMJ4G; Sat, 13 Mar 2010 20:21:19 +0000
From: ed <enelson1000@comcast.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Mar 2010 12:21:16 -0800
Message-ID: <1268511676.24057.12.camel@ed-hp-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 76.96.30.96
X-SA-Exim-Mail-From: enelson1000@comcast.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Alignment trap - deprecation.pyo
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
X-List-Received-Date: Sat, 13 Mar 2010 20:24:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I am trying to run a simple hello button python program using pygtk.

I have built a minimal-gpe-image for the mini2440.

But when I try and run the helloworld.py from the Pygtk tutorial.

=========================================================

#!/usr/bin/env python

# example helloworld.py

import pygtk
pygtk.require('2.0')
import gtk

class HelloWorld:

    # This is a callback function. The data arguments are ignored
    # in this example. More on callbacks below.
    def hello(self, widget, data=None):
        print "Hello World"

    def delete_event(self, widget, event, data=None):
        # If you return FALSE in the "delete_event" signal handler,
        # GTK will emit the "destroy" signal. Returning TRUE means
        # you don't want the window to be destroyed.
        # This is useful for popping up 'are you sure you want to quit?'
        # type dialogs.
        print "delete event occurred"

        # Change FALSE to TRUE and the main window will not be destroyed
        # with a "delete_event".
        return False

    def destroy(self, widget, data=None):
        print "destroy signal occurred"
        gtk.main_quit()

    def __init__(self):
        # create a new window
        self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
    
        # When the window is given the "delete_event" signal (this is
given
        # by the window manager, usually by the "close" option, or on
the
        # titlebar), we ask it to call the delete_event () function
        # as defined above. The data passed to the callback
        # function is NULL and is ignored in the callback function.
        self.window.connect("delete_event", self.delete_event)
    
        # Here we connect the "destroy" event to a signal handler.  
        # This event occurs when we call gtk_widget_destroy() on the
window,
        # or if we return FALSE in the "delete_event" callback.
        self.window.connect("destroy", self.destroy)
    
        # Sets the border width of the window.
        self.window.set_border_width(10)
    
        # Creates a new button with the label "Hello World".
        self.button = gtk.Button("Hello World")
    
        # When the button receives the "clicked" signal, it will call
the
        # function hello() passing it None as its argument.  The hello()
        # function is defined above.
        self.button.connect("clicked", self.hello, None)
    
        # This will cause the window to be destroyed by calling
        # gtk_widget_destroy(window) when "clicked".  Again, the destroy
        # signal could come from here, or the window manager.
        self.button.connect_object("clicked", gtk.Widget.destroy,
self.window)
    
        # This packs the button into the window (a GTK container).
        self.window.add(self.button)
    
        # The final step is to display this newly created widget.
        self.button.show()
    
        # and the window
        self.window.show()

    def main(self):
        # All PyGTK applications must have a gtk.main(). Control ends
here
        # and waits for an event to occur (like a key press or mouse
event).
        gtk.main()

# If the program is run directly or passed as an argument to the python
# interpreter then create a HelloWorld instance and show it
if __name__ == "__main__":
    hello = HelloWorld()
    hello.main()

==============================================================

I get the follow error when I run
#python -v pygtkHelloWorld.py

# /usr/lib/python2.6/site-packages/gtk-2.0/gtk/_lazyutils.pyo
matches /usr/lib/python2.6/site-packages/gtk-2.0/gtk/_lazyutils.py
import gtk._lazyutils # precompiled
from /usr/lib/python2.6/site-packages/gtk-2.0/gtk/_lazyutils.pyo
# /usr/lib/python2.6/site-packages/gtk-2.0/gtk/deprecation.pyo
matches /usr/lib/python2.6/site-packages/gtk-2.0/gtk/deprecation.py
import gtk.deprecation # precompiled
from /usr/lib/python2.6/site-packages/gtk-2.0/gtk/deprecation.pyo
Alignment trap: python (2412) PC=0x40bfa3c4 Instr=0x280069c0
Address=0xffffffff FSR 0x813
Segmentation fault


Does anyone have any ideas why it chokes at deprecation.pyo?????

Thanks
Ed




